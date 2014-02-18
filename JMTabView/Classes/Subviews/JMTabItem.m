//  Created by Jason Morrissey

#import "JMTabView.h"
#import "JMTabItem.h"
#import "JMTabContainer.h"

@implementation JMTabItem

@synthesize title = title_;
@synthesize icon = icon_;
@synthesize fixedWidth = fixedWidth_;
@synthesize executeBlock = executeBlock_;
@synthesize padding = padding_;
- (void)setPadding:(CGSize)padding {
    padding_ = padding;
    
    [self setNeedsDisplay];
}

- (void)dealloc;
{
    self.title = nil;
    self.icon = nil;
    self.executeBlock = nil;
    [super dealloc];
}

- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon;
{
    self = [super init];
    if (self)
    {
        self.title = title;
        self.icon = icon;
        self.backgroundColor = [UIColor clearColor];
        
        [self setIsAccessibilityElement:YES];
        [self setAccessibilityLabel:title];
        
        [self addTarget:self action:@selector(itemTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (CGSize) sizeThatFits:(CGSize)size;
{
    CGSize titleSize;
    if ([self.title respondsToSelector:@selector(sizeWithAttributes:)]) {
        titleSize = [self.title sizeWithAttributes:@{NSFontAttributeName: kTabItemFont}];
    }
    
    CGFloat width = titleSize.width;
    
    if (self.icon)
    {
        width += [self.icon size].width;
    }
    
    if (self.icon && self.title)
    {
        width += kTabItemIconMargin;
    }
    
    width += (self.padding.width * 2);
    
    CGFloat height = (titleSize.height > [self.icon size].height) ? titleSize.height : [self.icon size].height;
    
    height += (self.padding.height * 2);
    
    if (self.fixedWidth > 0)
    {
        width = self.fixedWidth;
        height = 1.;
    }
    
    return CGSizeMake(width, height);
}

- (void)drawRect:(CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * shadowColor = [UIColor blackColor];
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 1.0f, [shadowColor CGColor]);
    CGContextSaveGState(context);   
    
    if (self.highlighted)
    {
        CGRect bounds = CGRectInset(rect, 2., 2.);
        CGFloat radius = 0.5f * CGRectGetHeight(bounds);
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:radius];
        [[UIColor colorWithWhite:1. alpha:0.3] set];
        path.lineWidth = 2.;
        [path stroke];
    }
    
    CGFloat xOffset = self.padding.width;

    if (self.icon)
    {
        [self.icon drawAtPoint:CGPointMake(xOffset, self.padding.height)];
        xOffset += [self.icon size].width + kTabItemIconMargin;
    }
    
    [kTabItemTextColor set];
    
    CGFloat heightTitle;
    if ([self.title respondsToSelector:@selector(sizeWithAttributes:)]) {
        heightTitle = [self.title sizeWithAttributes:@{NSFontAttributeName: kTabItemFont}].height;
    }
    CGFloat titleYOffset = (self.bounds.size.height - heightTitle) / 2;
    
    if ([self.title respondsToSelector:@selector(drawAtPoint:withAttributes:)]){
        [self.title drawAtPoint:CGPointMake(xOffset, titleYOffset) withAttributes:@{NSFontAttributeName: kTabItemFont}];
    }
    
    
    CGContextRestoreGState(context);
}

- (void)setHighlighted:(BOOL)highlighted;
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

-(BOOL)isSelectedTabItem;
{
    JMTabContainer *tabContainer = (JMTabContainer *)[self superview];
    return [tabContainer isItemSelected:self];
}

- (void)itemTapped;
{
    JMTabContainer *tabContainer = (JMTabContainer *)[self superview];
    [tabContainer itemSelected:self];

    #ifdef NS_BLOCKS_AVAILABLE
    if (executeBlock_)
    {
        executeBlock_();
    }
    #endif
}

+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
{
    JMTabItem * tabItem = [[[JMTabItem alloc] initWithTitle:title icon:icon] autorelease];
    return tabItem;
}

+ (JMTabItem *)tabItemWithFixedWidth:(CGFloat)fixedWidth;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:nil icon:nil];
    tabItem.fixedWidth = fixedWidth;
    return tabItem;
}

#ifdef NS_BLOCKS_AVAILABLE
+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon];
    tabItem.executeBlock = executeBlock;
    return tabItem;
}
#endif

@end

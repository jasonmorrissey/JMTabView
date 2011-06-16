//  Created by Jason Morrissey

#import "JMTabItem.h"
#import "JMTabContainer.h"

@implementation JMTabItem

@synthesize title = title_;
@synthesize icon = icon_;
@synthesize executeBlock = executeBlock_;

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
    CGSize titleSize = [self.title sizeWithFont:kTabItemFont];
    
    CGFloat width = titleSize.width;
    
    if (self.icon)
    {
        width += [self.icon size].width;
    }
    
    if (self.icon && self.title)
    {
        width += kTabItemIconMargin;
    }
    
    width += (kTabItemPadding.width * 2);
    
    CGFloat height = (titleSize.height > [self.icon size].height) ? titleSize.height : [self.icon size].height;
    
    height += (kTabItemPadding.height * 2);
    
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
    
    CGFloat xOffset = kTabItemPadding.width;

    if (self.icon)
    {
        [self.icon drawAtPoint:CGPointMake(xOffset, kTabItemPadding.height)];
        xOffset += [self.icon size].width + kTabItemIconMargin;
    }
    
    [kTabItemTextColor set];
    [self.title drawAtPoint:CGPointMake(xOffset, kTabItemPadding.height) withFont:kTabItemFont];
    
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

#ifdef NS_BLOCKS_AVAILABLE
+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon];
    tabItem.executeBlock = executeBlock;
    return tabItem;
}
#endif

@end

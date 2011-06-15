//  Created by Jason Morrissey

#import "JMTabItem.h"
#import "JMTabContainer.h"

@implementation JMTabItem

@synthesize title = title_;
@synthesize icon = icon_;
@synthesize alternativeIcon = alternativeIcon_;
@synthesize executeBlock = executeBlock_;

- (void)dealloc;
{
    self.title = nil;
    self.icon = nil;
    self.alternativeIcon = nil;
    self.executeBlock = nil;
    [super dealloc];
}

- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon alternativeIcon:(UIImage *)alternativeIcon;
{
    self = [super init];
    if (self)
    {
        self.title = title;
        self.icon = icon;
        self.alternativeIcon = alternativeIcon;
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
    
    CGFloat titleWidth = titleSize.width;
    
    CGFloat iconWidth = [self.icon size].width;
   
    CGFloat width = (iconWidth > titleWidth) ? iconWidth : titleWidth;
   
    width += (kTabItemPadding.width * 2);
    
    CGFloat height = 50.;
    
    return CGSizeMake(width, height);
}

- (void)drawRect:(CGRect)rect;
{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIColor * shadowColor = [UIColor blackColor];
//    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 1.0f, [shadowColor CGColor]);
//    CGContextSaveGState(context);   
    
//    if (self.highlighted)
//    {
//        CGRect bounds = CGRectInset(rect, 2., 2.);
//        CGFloat radius = 0.5f * CGRectGetHeight(bounds);
//        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:radius];
//        [[UIColor colorWithWhite:1. alpha:0.3] set];
//        path.lineWidth = 2.;
//        [path stroke];
//    }
    
    CGRect bounds = rect;

    UIImage * iconImage = self.highlighted ? self.alternativeIcon : self.icon;
    
    // calculate icon position
    CGFloat iconWidth = [iconImage size].width;
    CGFloat iconMarginWidth = (bounds.size.width - iconWidth) / 2;
  
    [iconImage drawAtPoint:CGPointMake(iconMarginWidth, kTabItemPadding.height)];

    // calculate title position
    CGFloat titleWidth = [self.title sizeWithFont:kTabItemFont].width;
    CGFloat titleMarginWidth = (bounds.size.width - titleWidth) / 2;
    
    UIColor * textColor = self.highlighted ? [UIColor redColor] : kTabItemTextColor;
    [textColor set];
    [self.title drawAtPoint:CGPointMake(titleMarginWidth, kTabItemPadding.height + 22.) withFont:kTabItemFont];

    
//    
//    
//    
//    
//    
//    CGFloat xOffset = kTabItemPadding.width;
//
//    [self.icon drawAtPoint:CGPointMake(xOffset, kTabItemPadding.height)];
//    xOffset += [self.icon size].width + kTabItemIconMargin;
//    
   
//    CGContextRestoreGState(context);
}

- (void)setHighlighted:(BOOL)highlighted;
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

- (void)itemTapped;
{
    JMTabContainer *tabView = (JMTabContainer *)[self superview];
    [tabView itemSelected:self];

    #ifdef NS_BLOCKS_AVAILABLE
    if (executeBlock_)
    {
        executeBlock_();
    }
    #endif
}

+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternativeIcon:(UIImage *)alternativeIcon;
{
    JMTabItem * tabItem = [[[JMTabItem alloc] initWithTitle:title icon:icon alternativeIcon:alternativeIcon] autorelease];
    [tabItem sizeToFit];
    return tabItem;
}

#ifdef NS_BLOCKS_AVAILABLE
+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternativeIcon:(UIImage *)alternativeIcon executeBlock:(JMTabExecutionBlock)executeBlock;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon alternativeIcon:alternativeIcon];
    tabItem.executeBlock = executeBlock;
    return tabItem;
}
#endif

@end

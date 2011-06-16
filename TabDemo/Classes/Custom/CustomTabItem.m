#import "CustomTabItem.h"

#define kTabDemoVerticalItemPaddingSize CGSizeMake(18., 5.)
#define kTabDemoVerticalItemFont [UIFont boldSystemFontOfSize:11.]

@implementation CustomTabItem

@synthesize alternateIcon = alternateIcon_;

- (void) dealloc;
{
    self.alternateIcon = nil;
    [super dealloc];
}

- (CGSize) sizeThatFits:(CGSize)size;
{
    CGSize titleSize = [self.title sizeWithFont:kTabDemoVerticalItemFont];
    
    CGFloat titleWidth = titleSize.width;
    
    CGFloat iconWidth = [self.icon size].width;
    
    CGFloat width = (iconWidth > titleWidth) ? iconWidth : titleWidth;
    
    width += (kTabDemoVerticalItemPaddingSize.width * 2);
    
    CGFloat height = 56.;
    
    return CGSizeMake(width, height);
}

- (void)drawRect:(CGRect)rect;
{
    CGRect bounds = rect;
    CGFloat yOffset = kTabDemoVerticalItemPaddingSize.height + 10.;
    
    UIImage * iconImage = (self.highlighted || [self isSelectedTabItem]) ? self.alternateIcon : self.icon;
    
    // calculate icon position
    CGFloat iconWidth = [iconImage size].width;
    CGFloat iconMarginWidth = (bounds.size.width - iconWidth) / 2;
    
    [iconImage drawAtPoint:CGPointMake(iconMarginWidth, yOffset)];
    
    // calculate title position
    CGFloat titleWidth = [self.title sizeWithFont:kTabDemoVerticalItemFont].width;
    CGFloat titleMarginWidth = (bounds.size.width - titleWidth) / 2;
    
    UIColor * textColor = self.highlighted ? [UIColor lightGrayColor] : [UIColor whiteColor];
    [textColor set];
    [self.title drawAtPoint:CGPointMake(titleMarginWidth, yOffset + 22.) withFont:kTabDemoVerticalItemFont];
}

+ (CustomTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternateIcon:(UIImage *)alternativeIcon;
{
    CustomTabItem * tabItem = [[[CustomTabItem alloc] initWithTitle:title icon:icon] autorelease];
    tabItem.alternateIcon = alternativeIcon;
    return tabItem;
}

@end

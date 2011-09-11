//  Created by Jason Morrissey

#import <QuartzCore/QuartzCore.h>
#import "JMSelectionView.h"
#import "UIColor+Hex.h"
#import "UIView+InnerShadow.h"

@implementation JMSelectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self setBackgroundColor:[UIColor clearColor]];
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"4.0"))
        {
            self.layer.shadowOffset = CGSizeMake(0, 1);
            self.layer.shadowRadius = 1.;
            self.layer.shadowColor = [[UIColor whiteColor] CGColor];
            self.layer.shadowOpacity = 0.4;
        }
        self.clipsToBounds = NO;
    }
    return self;
}

- (void)layoutSubviews;
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self drawInnerShadowInRect:rect fillColor:[UIColor colorWithHex:0x252525]];
}

- (void)dealloc
{
    [super dealloc];
}

@end

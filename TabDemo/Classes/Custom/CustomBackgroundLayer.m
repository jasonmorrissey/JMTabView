//  Created by Jason Morrissey

#import "CustomBackgroundLayer.h"
#import "UIColor+Hex.h"

@implementation CustomBackgroundLayer

-(id)init;
{
    self = [super init];
    if (self)
    {
        CAGradientLayer * gradientLayer = [[[CAGradientLayer alloc] init] autorelease];
        UIColor * startColor = [UIColor colorWithHex:0x4a4b4a];
        UIColor * midColor = [UIColor colorWithHex:0x282928];
        UIColor * endColor = [UIColor colorWithHex:0x4a4b4a];
        gradientLayer.frame = CGRectMake(0, 8., 1024, 60);
        gradientLayer.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[midColor CGColor], (id)[endColor CGColor], nil];
        [self insertSublayer:gradientLayer atIndex:0];
    }
    return self;
}

@end

//  Created by Jason Morrissey

#import "CustomNoiseBackgroundView.h"

@implementation CustomNoiseBackgroundView

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGRect bounds = self.bounds;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:bounds];
    
    CGContextAddPath(context, [path CGPath]);
    CGContextClip(context);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    UIImage * noise = [UIImage imageNamed:@"noise-tile.png"];
    [noise drawAsPatternInRect:bounds];
    
    CGContextRestoreGState(context);
}

@end

//  Copyright (c) 2011, Kevin O'Neill
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
//
//  * Neither the name UsefulBits nor the names of its contributors may be used
//   to endorse or promote products derived from this software without specific
//   prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "UIView+Positioning.h"
#import "UIView+Size.h"

@implementation UIView (Positioning)

- (void)centerInRect:(CGRect)rect;
{
  [self setCenter:CGPointMake(floorf(CGRectGetMidX(rect)) + ((int)floorf([self width]) % 2 ? .5 : 0) , floorf(CGRectGetMidY(rect)) + ((int)floorf([self height]) % 2 ? .5 : 0))];
}

- (void)centerVerticallyInRect:(CGRect)rect;
{
  [self setCenter:CGPointMake([self center].x, floorf(CGRectGetMidY(rect)) + ((int)floorf([self height]) % 2 ? .5 : 0))];
}

- (void)centerHorizontallyInRect:(CGRect)rect;
{
  [self setCenter:CGPointMake(floorf(CGRectGetMidX(rect)) + ((int)floorf([self width]) % 2 ? .5 : 0), [self center].y)];
}

- (void)centerInSuperView;
{
  [self centerInRect:[[self superview] bounds]];
}
- (void)centerVerticallyInSuperView;
{
  [self centerVerticallyInRect:[[self superview] bounds]];
}
- (void)centerHorizontallyInSuperView;
{
  [self centerHorizontallyInRect:[[self superview] bounds]];
}

- (void)centerHorizontallyBelow:(UIView *)view padding:(CGFloat)padding;
{
    // for now, could use screen relative positions.
  NSAssert([self superview] == [view superview], @"views must have the same parent");
  
  [self setCenter:CGPointMake([view center].x,
                              floorf(padding + CGRectGetMaxY([view frame]) + ([self height] / 2)))];
}

- (void)centerHorizontallyBelow:(UIView *)view;
{
  [self centerHorizontallyBelow:view padding:0];
}

@end

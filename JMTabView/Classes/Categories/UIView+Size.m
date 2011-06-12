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

#import "UIView+Size.h"

@implementation UIView (Size)

- (void)setSize:(CGSize)size;
{
  CGPoint origin = [self frame].origin;
  
  [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

- (CGSize)size;
{
  return [self frame].size;
}

- (CGFloat)left;
{
  return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x;
{
  CGRect frame = [self frame];
  frame.origin.x = x;
  [self setFrame:frame];
}

- (CGFloat)top;
{
  return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y;
{
  CGRect frame = [self frame];
  frame.origin.y = y;
  [self setFrame:frame];
}

- (CGFloat)right;
{
  return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right;
{
  CGRect frame = [self frame];
  frame.origin.x = right - frame.size.width;
  
  [self setFrame:frame];
}

- (CGFloat)bottom;
{
  return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom;
{
  CGRect frame = [self frame];
  frame.origin.y = bottom - frame.size.height;

  [self setFrame:frame];
}

- (CGFloat)centerX;
{
  return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX;
{
  [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY;
{
  return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY;
{
  [self setCenter:CGPointMake(self.center.x, centerY)];
}

- (CGFloat)width;
{
  return CGRectGetWidth([self frame]);
}

- (void)setWidth:(CGFloat)width;
{
  CGRect frame = [self frame];
  frame.size.width = width;

  [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)height;
{
  return CGRectGetHeight([self frame]);
}

- (void)setHeight:(CGFloat)height;
{
  CGRect frame = [self frame];
  frame.size.height = height;
	
  [self setFrame:CGRectStandardize(frame)];
}

@end

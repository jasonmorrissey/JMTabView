//  Created by Jason Morrissey

#import <UIKit/UIKit.h>

@class JMTabView;

#pragma Mark -
#pragma Mark - JMTabViewDelegate

@protocol JMTabViewDelegate
-(void)tabView:(JMTabView *)tabView didSelectTabAtIndex:(NSUInteger)index;
@end

#pragma Mark -
#pragma Mark - JMTabView

@interface JMTabView : UIView 

- (void)setMomentary:(BOOL)momentary;
- (void)didSelectItemAtIndex:(NSUInteger)index;
- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
- (void)setSelectedIndex:(NSUInteger)index;
@property (nonatomic,assign) id<JMTabViewDelegate> delegate;

@end

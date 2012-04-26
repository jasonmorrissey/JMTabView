//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import "JMTabConstants.h"
#import "JMTabItem.h"
#import "JMSelectionView.h"

@class JMTabView;

#pragma Mark -
#pragma Mark - JMTabViewDelegate

@protocol JMTabViewDelegate <NSObject>
-(void)tabView:(JMTabView *)tabView didSelectTabAtIndex:(NSUInteger)itemIndex;
@end

#pragma Mark -
#pragma Mark - JMTabView

@interface JMTabView : UIView 

- (void)setMomentary:(BOOL)momentary;
- (void)didSelectItemAtIndex:(NSUInteger)itemIndex;
- (void)addTabItem:(JMTabItem *)tabItem;
- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
- (void)setSelectedIndex:(NSUInteger)itemIndex;
@property (nonatomic,jmfn_weak) id<JMTabViewDelegate> delegate;

#if NS_BLOCKS_AVAILABLE
- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;
#endif

#pragma Mark -
#pragma Mark - Customisation

- (void)setSelectionView:(JMSelectionView *)selectionView;
- (void)setItemSpacing:(CGFloat)itemSpacing;
- (void)setBackgroundLayer:(CALayer *)backgroundLayer;


@end

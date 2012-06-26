//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import "JMTabItem.h"
#import "JMSelectionView.h"

@interface JMTabContainer : UIScrollView

@property (nonatomic,retain) JMSelectionView * selectionView;
@property (assign) BOOL momentary;
@property (assign) NSUInteger selectedIndex;
@property (assign) CGFloat itemSpacing;

- (BOOL)isItemSelected:(JMTabItem *)tabItem;
- (void)itemSelected:(JMTabItem *)tabItem;
- (void)addTabItem:(JMTabItem *)tabItem;
- (void)removeTabItem:(JMTabItem *)tabItem;
- (void)removeAllTabItems;
- (void)animateSelectionToItemAtIndex:(NSUInteger)itemIndex;
- (NSUInteger)numberOfTabItems;
- (JMTabItem *)tabItemAtIndex:(NSUInteger)index;
@end

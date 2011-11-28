//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import "JMTabItem.h"
#import "JMSelectionView.h"

@interface JMTabContainer : UIView
{
    CGSize containerSize_;
}

@property (nonatomic,strong) JMSelectionView * selectionView;
@property (assign) BOOL momentary;
@property (assign) NSUInteger selectedIndex;
@property (assign) CGFloat itemSpacing;

- (BOOL)isItemSelected:(JMTabItem *)tabItem;
- (void)itemSelected:(JMTabItem *)tabItem;
- (void)addTabItem:(JMTabItem *)tabItem;
- (void)animateSelectionToItemAtIndex:(NSUInteger)itemIndex;
- (NSUInteger)numberOfTabItems;
@end

//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import "JMTabItem.h"

@interface JMTabContainer : UIView
{
    CGSize containerSize_;
}

@property (assign) BOOL momentary;

- (void)itemSelected:(JMTabItem *)tabItem;
- (void)addTabItem:(JMTabItem *)tabItem;
- (void)animateSelectionToItemAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfTabItems;
@end

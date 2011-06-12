//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import "JMTabItem.h"

@interface JMTabContainer : UIView
{
    CGSize containerSize_;
}

- (void)itemSelected:(JMTabItem *)tabItem;
- (void)addTabItem:(JMTabItem *)tabItem;
- (void)selectItemAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfTabItems;
@end

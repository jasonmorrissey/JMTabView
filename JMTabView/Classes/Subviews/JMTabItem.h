//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE
typedef void(^JMTabExecutionBlock)(void);
#endif

@interface JMTabItem : UIButton

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) UIImage * icon;

+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon;

#if NS_BLOCKS_AVAILABLE
@property (nonatomic,copy) JMTabExecutionBlock executeBlock;
+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;
#endif

@end

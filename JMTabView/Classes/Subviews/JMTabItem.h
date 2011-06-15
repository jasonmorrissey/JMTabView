//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE
typedef void(^JMTabExecutionBlock)(void);
#endif

@interface JMTabItem : UIButton

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) UIImage * icon;
@property (nonatomic,retain) UIImage * alternativeIcon;

#if NS_BLOCKS_AVAILABLE
@property (nonatomic,copy) JMTabExecutionBlock executeBlock;
+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternativeIcon:(UIImage *)alternativeIcon executeBlock:(JMTabExecutionBlock)executeBlock;
#endif

@end

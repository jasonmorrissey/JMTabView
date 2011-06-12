//  Created by Jason Morrissey

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface JMTabItem : UIButton

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) UIImage * icon;

+ (JMTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
@end

//  Created by Jason Morrissey

#import <JMTabView/JMTabView.h>

@interface CustomTabItem : JMTabItem 

@property (nonatomic,retain) UIImage * alternateIcon;

+ (CustomTabItem *)tabItemWithTitle:(NSString *)title icon:(UIImage *)icon alternateIcon:(UIImage *)icon;

@end

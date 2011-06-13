//  Created by Jason Morrissey

#import "JMTabView.h"
#import "JMTabContainer.h"
#import "BarBackgroundLayer.h"
#import "UIView+Positioning.h"

@interface JMTabView()
@property (nonatomic,retain) JMTabContainer * tabContainer;
@end

@implementation JMTabView

@synthesize tabContainer = tabContainer_;
@synthesize delegate = delegate_;

- (void)dealloc;
{
    self.tabContainer = nil;
    self.delegate = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.tabContainer = [[[JMTabContainer alloc] initWithFrame:self.bounds] autorelease];
        [self addSubview:self.tabContainer];
    }
    return self;
}

+(Class)layerClass 
{
    return [BarBackgroundLayer class];
}

- (void)layoutSubviews;
{
    [self.tabContainer centerInSuperView];
}

#pragma Mark -
#pragma Mark Notifying Delegates

- (void)didSelectItemAtIndex:(NSUInteger)index;
{
    if (self.delegate)
    {
        [self.delegate tabView:self didSelectTabAtIndex:index];
    }
}

#pragma Mark -
#pragma External Interface

- (void)setMomentary:(BOOL)momentary;
{
    [self.tabContainer setMomentary:momentary];
}

- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon];
    [self.tabContainer addTabItem:tabItem];
}

- (void)setSelectedIndex:(NSUInteger)index;
{
    [self.tabContainer layoutSubviews];
    [self.tabContainer animateSelectionToItemAtIndex:index];
}

@end

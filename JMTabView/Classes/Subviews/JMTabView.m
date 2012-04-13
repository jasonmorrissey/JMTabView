//  Created by Jason Morrissey

#import "JMTabView.h"
#import "JMTabContainer.h"
#import "BarBackgroundLayer.h"
#import "UIView+Positioning.h"

@interface JMTabView()
@property (nonatomic,retain) JMTabContainer * tabContainer;
@end

@implementation JMTabView

@synthesize delegate = delegate_;
@synthesize selectedIndex = selectedIndex_;
@synthesize tabContainer = tabContainer_;
@synthesize itemPadding = itemPadding_;

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
        [self setBackgroundLayer:[[[BarBackgroundLayer alloc] init] autorelease]];
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.tabContainer = [[[JMTabContainer alloc] initWithFrame:self.bounds] autorelease];
        self.itemPadding = kTabItemPadding; 
        [self addSubview:self.tabContainer];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setBackgroundLayer:[[[BarBackgroundLayer alloc] init] autorelease]];
        [self setTabContainer:[[[JMTabContainer alloc] initWithFrame:self.bounds] autorelease]];
        self.itemPadding = kTabItemPadding; 
        [self addSubview:self.tabContainer];
    }
    return self;
}

- (void)setBackgroundLayer:(CALayer *)backgroundLayer;
{
    CALayer * oldBackground = [[self.layer sublayers] objectAtIndex:0];
    if (oldBackground)
    {
        [self.layer replaceSublayer:oldBackground with:backgroundLayer];
    }
    else
    {
        [self.layer insertSublayer:backgroundLayer atIndex:0];
    }
}

- (void)layoutSubviews;
{
    [self.tabContainer centerInSuperView];
}

#pragma Mark -
#pragma Mark Notifying Delegates

- (void)didSelectItemAtIndex:(NSUInteger)itemIndex;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectTabAtIndex:)])
    {
        [self.delegate tabView:self didSelectTabAtIndex:itemIndex];
    }
}

#pragma Mark -
#pragma External Interface

- (void)setMomentary:(BOOL)momentary;
{
    [self.tabContainer setMomentary:momentary];
}

- (void)addTabItem:(JMTabItem *)tabItem;
{
    [tabItem setPadding:[self itemPadding]];
    
    [self.tabContainer addTabItem:tabItem];
}

- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon];
    [self addTabItem:tabItem];
}

- (void)removeTabItemAtIndex:(NSUInteger)index {
    [self.tabContainer removeTabItem:[self.tabContainer tabItemAtIndex:index]];
}

- (void)removeAllTabItems {
    [self.tabContainer removeAllTabItems];
}

#if NS_BLOCKS_AVAILABLE
- (void)addTabItemWithTitle:(NSString *)title icon:(UIImage *)icon executeBlock:(JMTabExecutionBlock)executeBlock;
{
    JMTabItem * tabItem = [JMTabItem tabItemWithTitle:title icon:icon executeBlock:executeBlock];
    
    [self addTabItem:tabItem];
}
#endif

- (void)setSelectedIndex:(NSUInteger)itemIndex;
{
    [self.tabContainer layoutSubviews];
    [self.tabContainer animateSelectionToItemAtIndex:itemIndex];
}

- (NSUInteger)selectedIndex {
    return [self.tabContainer selectedIndex];
}

- (void)setTabItemPadding:(CGSize)itemPadding {
    self.itemPadding = itemPadding;
    
    NSUInteger tabItemIndex, numberOfTabItems = [[self tabContainer] numberOfTabItems];
    
    for (tabItemIndex=0; tabItemIndex<numberOfTabItems; tabItemIndex++) {
        JMTabItem *tabItem = [[self tabContainer] tabItemAtIndex:tabItemIndex];
        
        [tabItem setPadding:itemPadding];
    }
    
    [[self tabContainer] layoutSubviews];
}

#pragma Mark -
#pragma Customisation

- (void)setSelectionView:(JMSelectionView *)selectionView;
{
    [[self.tabContainer selectionView] removeFromSuperview];
    [self.tabContainer setSelectionView:selectionView];
    [self.tabContainer insertSubview:selectionView atIndex:0];
}

- (void)setItemSpacing:(CGFloat)itemSpacing;
{
    [self.tabContainer setItemSpacing:itemSpacing];
    [self.tabContainer setNeedsLayout];
}

@end

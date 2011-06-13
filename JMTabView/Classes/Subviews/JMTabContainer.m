//  Created by Jason Morrissey

#import "JMTabContainer.h"
#import "JMSelectionView.h"
#import "JMTabView.h"
#import "UIView+Positioning.h"

#define kSelectionAnimation @"kSelectionAnimation"

@interface JMTabContainer()
@property (nonatomic,retain) NSMutableArray * tabItems;
@property (nonatomic,retain) JMSelectionView * selectionView;
@end

@implementation JMTabContainer

@synthesize tabItems = tabItems_;
@synthesize selectionView = selectionView_;
@synthesize momentary = momentary_;

- (void)dealloc
{
    self.tabItems = nil;
    self.selectionView = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.tabItems = [NSMutableArray array];
        self.selectionView = [[[JMSelectionView alloc] initWithFrame:CGRectZero] autorelease];
        [self addSubview:self.selectionView];
    }
    return self;
}

- (void)layoutSubviews;
{
    CGFloat xOffset = 0.;
    CGFloat yOffset = 0.;
    CGFloat itemHeight = 0.;
    
    for (JMTabItem * item in self.tabItems)
    {
        [item setFrame:CGRectMake(xOffset, yOffset, item.frame.size.width, item.frame.size.height)];
        
        xOffset += item.frame.size.width;
        
        if (item != [self.tabItems lastObject])
        {
            xOffset += kTabSpacing;
        }

        itemHeight = item.frame.size.height;
    }

    containerSize_.width = xOffset;
    containerSize_.height = itemHeight;
    
    [self sizeToFit];
    [self centerInSuperView];
}

- (CGSize)sizeThatFits:(CGSize)size;
{
    return containerSize_;
}

- (void)addTabItem:(JMTabItem *)tabItem;
{
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
    [self setNeedsLayout];
}

- (void)itemSelected:(JMTabItem *)tabItem;
{
    NSUInteger index = [self.tabItems indexOfObject:tabItem];
    
    if (!self.momentary)
    {
        [self animateSelectionToItemAtIndex:index];
    }
    
    // notify parent tabView
    JMTabView * tabView = (JMTabView *)[self superview];
    [tabView didSelectItemAtIndex:index];
}

- (void)animateSelectionToItemAtIndex:(NSUInteger)index;
{
    JMTabItem * tabItem = [self.tabItems objectAtIndex:index];
    [UIView beginAnimations:kSelectionAnimation context:self.selectionView];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGRectIsEmpty(self.selectionView.frame) ? 0 : kTabSelectionAnimationDuration)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.selectionView.frame = tabItem.frame;
    [UIView commitAnimations];
}

- (NSUInteger)numberOfTabItems;
{
    return [self.tabItems count];
}

@end

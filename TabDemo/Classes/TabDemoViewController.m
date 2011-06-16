//  Created by Jason Morrissey

#import "TabDemoViewController.h"

@implementation TabDemoViewController

-(void)loadView;
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    JMTabView * tabView = [[[JMTabView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60.)] autorelease];
    
    [tabView setDelegate:self];
    
    [tabView addTabItemWithTitle:@"One" icon:[UIImage imageNamed:@"icon1.png"]];
    [tabView addTabItemWithTitle:@"Two" icon:[UIImage imageNamed:@"icon2.png"]];
    [tabView addTabItemWithTitle:@"Three" icon:[UIImage imageNamed:@"icon3.png"]];

//    You can run blocks by specifiying an executeBlock: paremeter
//    #if NS_BLOCKS_AVAILABLE
//    [tabView addTabItemWithTitle:@"b2" icon:nil executeBlock:^{NSLog(@"abc");}];
//    [tabView addTabItemWithTitle:@"b3" icon:nil executeBlock:^{NSLog(@"123");}];
//    #endif
    
    [tabView setSelectedIndex:0];
    
    [self.view addSubview:tabView];
}

-(void)tabView:(JMTabView *)tabView didSelectTabAtIndex:(NSUInteger)index;
{
    NSLog(@"Selected Tab Index: %d", index);
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
{
    return YES;
}

@end

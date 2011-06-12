//  Created by Jason Morrissey

#import "TabDemoAppDelegate.h"
#import "TabDemoViewController.h"

@implementation TabDemoAppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	TabDemoViewController * demoViewController = [[[TabDemoViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:demoViewController] autorelease];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc 
{
	self.navigationController = nil;
    self.window = nil;
	[super dealloc];
}


@end

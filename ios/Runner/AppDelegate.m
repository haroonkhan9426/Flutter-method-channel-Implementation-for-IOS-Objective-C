#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "ShowMarkerAndNavigateVC.h"
#include "MultipleMarkersVC.h"
@implementation AppDelegate

static NSString *const SHARE_CHANNEL = @"foo";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    //Initi View Controllers
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    MultipleMarkersVC *multipleMarkersVC = [[MultipleMarkersVC alloc] init];
    ShowMarkerAndNavigateVC *showMarkerAndNavigateVC = [[ShowMarkerAndNavigateVC alloc] init];
    
    //setup Navigator
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.window makeKeyAndVisible];
    
    //Communication interface
    FlutterMethodChannel *shareChannel =
    [FlutterMethodChannel methodChannelWithName:SHARE_CHANNEL
                                binaryMessenger:controller];
    
    [shareChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"Welcome to IOS");
        if ([@"ShowLocationAndNavigate" isEqualToString:call.method]) {
        //Show Location and Navigate
            NSLog(@"Show Location And Navigate");
            @try {
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UIViewController *view_from_board = [sb instantiateViewControllerWithIdentifier:@"ShowMarkerAndNavigateVC"];
                [self.navigationController pushViewController:view_from_board animated:YES];
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
        }else if([@"ShowMultipleLocations" isEqualToString:call.method]){
        //Show Multiple Locations
            NSLog(@"Show Multiple Locations");
            @try {
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UIViewController *view_from_board = [sb instantiateViewControllerWithIdentifier:@"MultipleMarkersVC"];
                [self.navigationController pushViewController:view_from_board animated:YES];
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
        }
        
        
    }
     ];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end

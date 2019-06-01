#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "ShowMarkerAndNavigateVC.h"
#include "MultipleMarkersVC.h"
#import "Runner-Swift.h"
#include <Mapbox/Mapbox.h>
@implementation AppDelegate

static NSString *const SHARE_CHANNEL = @"foo";
@synthesize markers;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    //Initi View Controllers
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    
    /* Test static markers array setup starts */
    //markers = (NSMutableArray *)[[MGLPointAnnotation alloc] init];
    markers = [[NSMutableArray alloc] init];
    
    
    @try {
        MGLPointAnnotation *marker1 = [[MGLPointAnnotation alloc] init];
        marker1.coordinate = CLLocationCoordinate2DMake(33.696003, 73.102223);
        marker1.title = @"Shakar Pariyan";
        marker1.subtitle = @"Best place to visit";
        
        [markers addObject: marker1];
        
        MGLPointAnnotation *marker2 = [[MGLPointAnnotation alloc] init];
        marker2.coordinate = CLLocationCoordinate2DMake(33.702330, 73.020637);
        marker2.title = @"Jinnah Park";
        marker2.subtitle = @"Best place to visit";
        
        [markers addObject: marker2];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
   
    
     /* Test static markers array setup ends */
    
    
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
                UIViewController *view_from_board = [sb instantiateViewControllerWithIdentifier:@"MapboxVC"];
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
                UIViewController *view_from_board = [sb instantiateViewControllerWithIdentifier:@"MapBoxNavigationVC"];
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

- (NSMutableArray *) getMarkers{
    return markers;
}
@end

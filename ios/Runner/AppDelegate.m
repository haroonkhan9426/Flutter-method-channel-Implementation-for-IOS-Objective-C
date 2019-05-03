#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

static NSString *const SHARE_CHANNEL = @"foo";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel *shareChannel =
    [FlutterMethodChannel methodChannelWithName:SHARE_CHANNEL
                                binaryMessenger:controller];
    
    [shareChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"Welcome to IOS");
        if ([@"ShowLocationAndNavigate" isEqualToString:call.method]) {
        //Show Location and Navigate
            NSLog(@"Show Location And Navigate");
        }else if([@"ShowMultipleLocations" isEqualToString:call.method]){
        //Show Multiple Locations
            NSLog(@"Show Multiple Locations");
        }
    }
     ];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end

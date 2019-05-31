#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : FlutterAppDelegate
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *markers;

- (NSMutableArray *) getMarkers;
@end

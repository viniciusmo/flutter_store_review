#import "StoreReviewPlugin.h"
#import <StoreKit/StoreKit.h>

@implementation StoreReviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"store_review"
            binaryMessenger:[registrar messenger]];
  StoreReviewPlugin* instance = [[StoreReviewPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([call.method isEqualToString:@"requestReview"]) {
        if (@available(iOS 10.3, *)){
            [SKStoreReviewController requestReview];
            result(nil);
        }
    }else if([call.method isEqualToString:@"isAvailable"]){
        if (@available(iOS 10.3, *)){
           result([NSNumber numberWithBool:YES]);
        }else{
           result([NSNumber numberWithBool:NO]);
        }
    }else{
        result(FlutterMethodNotImplemented);
    }

}

@end

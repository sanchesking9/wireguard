#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNWireguard, NSObject)

RCT_EXTERN_METHOD(_connect:(NSString *)config
                  session:(NSString *)session
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(_disconnect:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(_status:(RCTPromiseResolveBlock)resolve)

RCT_EXTERN_METHOD(_version:(RCTPromiseResolveBlock)resolve)

@end

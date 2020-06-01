#import <Foundation/Foundation.h>

@interface LuaBridge: NSObject
+ (void) migrate: (void (^)(NSString *)) callback;
+ (void) setConfig: (NSArray *)config;
+ (void) setConfigIndex: (NSArray *)config;
+ (NSArray *) getSettings;
+ (void) saveSettings: (NSString *)server token:(NSString *)token;
@end

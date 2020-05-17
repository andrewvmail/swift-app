#import <Foundation/Foundation.h>

@interface LuaBridge: NSObject
+ (void) migrate: (void (^)(NSString *)) callback;
+ (NSArray *) getSettings;
+ (void) saveSettings: (NSString *)server token:(NSString *)token;
@end

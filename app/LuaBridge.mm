#import <LuakitPod/oc_helpers.h>
#include "business_runtime.h"
//#include "tools/lua_helpers.h"
#import "LuaBridge.h"
#import "oc_helpers.h"
#import "lauxlib.h"
#import "NotificationProxyObserver.h"
#include "scoped_ptr.h"

@interface LuaBridge()<NotificationProxyObserverDelegate>{
    scoped_ptr<NotificationProxyObserver> _notification_observer;
}
@end

@implementation LuaBridge : NSObject

+ (void) migrate: (void (^)(NSString * response)) callback {
    call_lua_function(@"bridge", @"migrate", callback);
}

+ (NSArray *) getSettings {
    return call_lua_function(@"bridge", @"getSettings");
}
+ (void)saveSettings:(NSString *)server token:(NSString *)token {
    call_lua_function(@"bridge", @"saveSettings", server, token);
}
- (void)onNotification:(int)type data:(id)data
{
    NSLog(@"object-c onNotification type = %d data = %@", type , data);
}

@end

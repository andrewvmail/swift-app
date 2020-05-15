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
- (void) test {
    call_lua_function(@"_G", @"print", @"momo");
    lua_State * state = getCurrentThreadLuaState();
    luaL_dostring(state, "require('notification_test').test()");



    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.5);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        _notification_observer.reset(new NotificationProxyObserver(self));
        _notification_observer->AddObserver(3);
        post_notification(3, @{@"row":@"hello"});
//        luaL_dostring(state, "require('notification_test').postNotificationOnIOThread()");
    });

}
- (void)onNotification:(int)type data:(id)data
{
    NSLog(@"object-c onNotification type = %d data = %@", type , data);
}
@end

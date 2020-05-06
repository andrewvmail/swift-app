#import <LuakitPod/oc_helpers.h>
#import "LuaKit.h"

void luaError (const char * info)
{
    if (info != NULL) {
        NSLog(@"%@",[NSString stringWithUTF8String:info]);
    }
}

@implementation LuaKit : NSObject
- (void) start {
    startLuakit(0, {});
}
- (void) error {
    setLuaError(luaError);
}
@end

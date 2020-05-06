#import <LuakitPod/oc_helpers.h>
#include "business_runtime.h"
//#include "tools/lua_helpers.h"
#import "LuaBridge.h"
#import "oc_helpers.h"
#import "lauxlib.h"

@implementation LuaBridge : NSObject
- (void) test {
    call_lua_function(@"_G", @"print", @"momo");
}
@end

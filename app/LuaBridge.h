#import <Foundation/Foundation.h>

@interface LuaBridge: NSObject
- (void) start;
- (void) migrate: (void (^)(NSString *)) callback;
@end

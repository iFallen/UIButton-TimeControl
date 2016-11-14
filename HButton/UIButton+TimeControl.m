//
//  UIButton+TimeControl.m
//  HButton
//
//  Created by JuanFelix on 14/11/2016.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "UIButton+TimeControl.h"
#import <objc/runtime.h>

@implementation UIButton (TimeControl)

+(void)load{
    Method before = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after  = class_getInstanceMethod(self, @selector(xx_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

-(void)xx_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if ([NSDate date].timeIntervalSince1970 - self.lastCallTime < self.acceptEventInterval) {
        return;
    }
    if (self.acceptEventInterval > 0) {
        self.lastCallTime = [NSDate date].timeIntervalSince1970;
    }
    [self xx_sendAction:action to:target forEvent:event];
}

static const char * UIControl_acceptEventInterval = "UIControl_accpetEventInterval";

- (NSTimeInterval)acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char * UIControl_lastCallTime = "UIControl_lastCallTime";

- (NSTimeInterval)lastCallTime{
    return  [objc_getAssociatedObject(self, UIControl_lastCallTime) doubleValue];
}

- (void)setLastCallTime:(NSTimeInterval)lastCallTime{
    objc_setAssociatedObject(self, UIControl_lastCallTime, @(lastCallTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

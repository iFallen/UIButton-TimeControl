//
//  UIButton+TimeControl.h
//  HButton
//
//  Created by JuanFelix on 14/11/2016.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TimeControl)

/*事件响应事件间隔*/
@property (nonatomic,assign)  NSTimeInterval acceptEventInterval;
/*上一次执行的时间*/
@property (nonatomic,assign,readonly) NSTimeInterval lastCallTime;

@end

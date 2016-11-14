//
//  ViewController.m
//  HButton
//
//  Created by JuanFelix on 14/11/2016.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+TimeControl.h"

@interface ViewController ()

@property (nonatomic,assign) NSTimeInterval lastCallTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 100, 30)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn setCenter:self.view.center];
    [btn addTarget:self action:@selector(buttonTestAction) forControlEvents:UIControlEventTouchUpInside];
    btn.acceptEventInterval = 1.0;//时间响应间隔时间
    [self.view addSubview:btn];
}

-(void)buttonTestAction{
    static int indexa = 1;
    NSLog(@"call %d...",indexa++);
}


-(void)buttonTestAction1{
    if (_lastCallTime <= 0) {
        _lastCallTime = [NSDate date].timeIntervalSince1970;
        NSLog(@"Call Once");
    }else{
        NSTimeInterval cur = [NSDate date].timeIntervalSince1970;
        NSTimeInterval t = (cur - _lastCallTime);        NSLog(@"Call Again,∆t = %fs",t);
        _lastCallTime = 0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

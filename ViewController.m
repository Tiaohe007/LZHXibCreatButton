//
//  ViewController.m
//  LZHXibCreatButton
//
//  Created by ios开发 on 17/5/19.
//  Copyright © 2017年 ios开发. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 *  文本框内容改变后的回调
 */
@property (nonatomic, copy) void (^callBack) (NSString *currentNum);
// 计时器
@property(nonatomic,strong)NSTimer *timer;

// 显示数字的label
@property (weak, nonatomic) IBOutlet UILabel *ShowNumber;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 内容更改的block回调
    self.callBack = ^(NSString *currentNum){
        
        NSLog(@"%@", currentNum);
    
    };}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 增加按钮的方法
- (IBAction)IncreaseBtn:(id)sender {
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increase) userInfo:nil repeats:NO];
}
#pragma mark - 减少按钮的方法
- (IBAction)DecreaseBtn:(id)sender {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrease) userInfo:nil repeats:NO];
}


- (void)increase{
    if (_ShowNumber.text.length == 0) {
        _ShowNumber.text = @"1";
    }
    int newNum = [_ShowNumber.text intValue] + 1;
    _ShowNumber.text = [NSString stringWithFormat:@"%i", newNum];
    self.callBack(_ShowNumber.text);
}
- (void)setCurrentNum:(NSString *)currentNum{
    _ShowNumber.text = currentNum;
}

- (NSString *)currentNum{
    return _ShowNumber.text;
}


- (void)decrease{
    if (_ShowNumber.text.length == 0) {
        _ShowNumber.text = @"1";
    }
    int newNum = [_ShowNumber.text intValue] -1;
    if (newNum > 0) {
        _ShowNumber.text = [NSString stringWithFormat:@"%i", newNum];
        self.callBack(_ShowNumber.text);
    } else {
        NSLog(@"num can not less than 1");
    }
}
- (void)dealloc{
    [self cleanTimer];
}

- (void)cleanTimer{
    if (_timer.isValid) {
        [_timer invalidate];
        _timer = nil;
    }
}
@end

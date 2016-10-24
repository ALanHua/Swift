//
//  ViewController.m
//  09-闭包
//
//  Created by yhp on 2016/10/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**  */
@property(nonatomic,copy) void (^myBolck)();
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     闭包和oc的block很相似
     block 类似于匿名函数
     格式: 返回值类型(^block名称)(参数列表)
     闭包 定义函数
     作用:
     保存一段代码，在需要的时候执行
     */
    
    self.myBolck = ^{
        NSLog(@"我被执行了");
    };
    
    [self loadData:^{
         NSLog(@"执行回调");
    }];
}

-(void)loadData:(void(^)())finished
{
    NSLog(@"执行耗时操作");
    // 回调通知调用者
    finished();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.myBolck();
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         NSLog(@"执行耗时操作");
        dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"回到主线程");
        });
    });
}


@end

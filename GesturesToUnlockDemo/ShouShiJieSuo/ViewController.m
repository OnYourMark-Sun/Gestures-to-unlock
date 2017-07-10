//
//  ViewController.m
//  hsoushi
//
//  Created by qianfeng on 16/8/13.
//  Copyright © 2016年 com.xujiahui. All rights reserved.
//

#import "ViewController.h"
#import "xsyGesturesToUnlock.h"
#import "ShizhiViewController.h"

#import "zhengqueViewController.h"
@interface ViewController ()<aaatiaozhule>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
}
//每次启动都刷视图数据
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self creat];
    
    
}

//导入手势锁 视图
-(void)creat{
    xsyGesturesToUnlock * shou = [[xsyGesturesToUnlock alloc] initWithFrame:self.view.frame];
    
    shou.dekele = self;
    
    
    shou.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:shou];
    
    
    
    
}

//解锁成功的跳转
-(void)tiaozhuan{
    
    [self.navigationController pushViewController:[[zhengqueViewController alloc]init] animated:YES];
    
    
}

//创建成功  密码保存的  事件
-(void)baocunmima{
    
    
   
    
    [self.navigationController pushViewController:[[zhengqueViewController alloc]init] animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

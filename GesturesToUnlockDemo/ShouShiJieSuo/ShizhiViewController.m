//
//  ShizhiViewController.m
//  hsoushi
//
//  Created by qianfeng on 16/8/13.
//  Copyright © 2016年 com.xujiahui. All rights reserved.
//

#import "ShizhiViewController.h"

@interface ShizhiViewController ()

@end

@implementation ShizhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creat];
    
    
    
}

-(void)creat{
    
    UIButton * bu = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    [bu setTitle:@"重设密码" forState:UIControlStateNormal];
    
    [bu addTarget:self action:@selector(bubu) forControlEvents:UIControlEventTouchUpInside];
    bu.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:bu];
    
    
}

//
-(void)bubu{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSUserDefaults * us = [NSUserDefaults standardUserDefaults];
   
    [us setValue:nil forKey:@"mimi"];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

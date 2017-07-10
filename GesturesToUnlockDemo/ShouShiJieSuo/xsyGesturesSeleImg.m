//
//  xsyGesturesSeleImg.m
//  ShouShiJieSuo
//
//  Created by qianfeng on 16/8/13.
//  Copyright © 2016年 com.xujiahui. All rights reserved.
//

#import "xsyGesturesSeleImg.h"

@implementation xsyGesturesSeleImg

-(void)drawRect:(CGRect)rect{
    
    CGFloat cenx = self.frame.size.width/2;
    CGFloat ceny = self.frame.size.height/2;
    
    
    CGContextRef xsyREF = UIGraphicsGetCurrentContext();

    //外大1
    CGContextAddArc(xsyREF, cenx, ceny, 26, 0, 2*M_PI, 1);
    
    [[UIColor colorWithRed:158/255.0 green:240/255.0 blue:238/255.0 alpha:1]setFill];
    CGContextFillPath(xsyREF);
    
    //外大2
    CGContextAddArc(xsyREF, cenx, ceny, 23, 0, 2*M_PI, 1);
    
    [[UIColor colorWithRed:120/255.0 green:189/255.0 blue:220/255.0 alpha:1]setFill];
    CGContextFillPath(xsyREF);
    
    //中心外 套圆
    
    CGContextAddArc(xsyREF, cenx, ceny, 20, 0, 2*M_PI, 1);
    [[UIColor grayColor]setFill];
    CGContextFillPath(xsyREF);
    
    //中心圆
    CGContextAddArc(xsyREF, cenx, ceny, 10, 0, 2*M_PI, 1);
    
    [[UIColor whiteColor]setFill];
    CGContextFillPath(xsyREF);
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

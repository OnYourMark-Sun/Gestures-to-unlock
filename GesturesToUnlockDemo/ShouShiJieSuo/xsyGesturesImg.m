//
//  xsyGesturesImg.m
//  ShouShiJieSuo
//
//  Created by qianfeng on 16/8/13.
//  Copyright © 2016年 com.xujiahui. All rights reserved.
//

#import "xsyGesturesImg.h"

@implementation xsyGesturesImg
-(void)drawRect:(CGRect)rect{
    
    
    CGContextRef xsyRef =UIGraphicsGetCurrentContext();

   // CGContextSetLineWidth(xsyRef, 20);
    
   // CGContextAddEllipseInRect(xsyRef, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    CGFloat cenx = self.frame.size.width/2;
    CGFloat ceny = self.frame.size.height/2;
    
    
    CGContextAddArc(xsyRef, cenx, ceny, 30, 0, 2*M_PI, 1);
    
    [[UIColor grayColor]setFill];
    CGContextFillPath(xsyRef);
    
    CGContextAddArc(xsyRef, self.frame.size.width/2, self.frame.size.height/2, 10, 0, 2*M_PI, 1);
    
    [[UIColor blackColor]setFill];

    CGContextFillPath(xsyRef);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

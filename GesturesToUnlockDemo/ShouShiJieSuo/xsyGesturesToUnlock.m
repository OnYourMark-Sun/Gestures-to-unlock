//
//  xsyGesturesToUnlock.m
//  ShouShiJieSuo
//
//  Created by qianfeng on 16/8/13.
//  Copyright © 2016年 com.xujiahui. All rights reserved.
//

#import "xsyGesturesToUnlock.h"

@interface xsyGesturesToUnlock ()
{
    UIView * shitu;
    UIButton * _bunei;
    UIButton * _buwai;
    BOOL youzhi;
    
    
}
@property(nonatomic,strong)NSMutableArray * buttons;
@property(nonatomic,copy)NSMutableString * mimi;



@end
@implementation xsyGesturesToUnlock
-(NSMutableArray*)buttons{
    
    if (!_buttons) {
        _buttons = [NSMutableArray array];
        
    }
    
    return _buttons;
    
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
        
    }
    
    return self;
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super initWithCoder:aDecoder]) {
        [self creat];
        
    }
    
    return self;
    
}


-(void)creat{
    
    //背景图
    UIImageView * imgvi = [[UIImageView alloc] initWithFrame:self.frame];
    imgvi.image = [UIImage imageNamed:@"background.jpg"];
    imgvi.userInteractionEnabled = NO;
    
    //[self addSubview:imgvi];
    
 
    _mimi = [[NSMutableString alloc] init];
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSString * str = [user valueForKey:@"mimi"];
    if (str) {
        youzhi = 1;
        
    }
    else{
        youzhi = 0;
        
    }
    
    for (int i=0; i<9; i++) {
        
        CGFloat jiange = 50;
        
        _buwai = [[UIButton alloc] initWithFrame:CGRectMake((jiange+i%3*(jiange+60)), (150+i/3*(jiange+60)), 60, 60)];
        
        _buwai.tag = i+9;
        
        [self addSubview:_buwai];
        
    //button图片
        [_buwai setImage:[UIImage imageNamed:@"img.jpg"] forState:UIControlStateNormal];

        [_buwai setImage:[UIImage imageNamed:@"imgsele.jpg"] forState:UIControlStateSelected];
        _buwai.backgroundColor = [UIColor clearColor];
        
        _buwai.userInteractionEnabled = NO;
        
//                _bunei = [[UIButton alloc] initWithFrame:CGRectMake((jiange+20+i%3*(jiange+60)), (150+20+i/3*(jiange+60)), 20, 20)];
//                _bunei.tag=i;
//                _bunei.backgroundColor = [UIColor clearColor];
//        
//        _bunei.userInteractionEnabled = NO;
//        
//        
//         [self addSubview:_bunei];
//        
//        
        
    }
}

//触摸开始监听移动

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint toupoint = [touch locationInView:touch.view];
    
    UIButton * but = [self getCrrenButtonPoint:toupoint];
    
    if (but&&but.selected!=YES) {
        but.selected = YES;
        
        [_mimi appendString: [NSString stringWithFormat:@"%ld",but.tag]];
        
        [self.buttons addObject:but];
        
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * tou = [touches anyObject];
    CGPoint point = [tou locationInView:tou.view];
    
    UIButton * but = [self getCrrenButtonPoint:point];
    
    
    
    
    if (but && but.selected!=YES) {
        but.selected = YES;
        
        [self.buttons addObject:but];
        [_mimi appendString: [NSString stringWithFormat:@"%ld",but.tag]];
        
        NSLog(@"mimi__%@",_mimi);
        
        
        
        [self setNeedsDisplay];
    }
    
}
-(UIButton*)getCrrenButtonPoint:(CGPoint)point{
    for(UIButton * bu in self.subviews){
        
        if (CGRectContainsPoint(bu.frame, point)) {
            return bu;
            
        }
    }
    
    return nil;
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for(UIButton * bu in _buttons){
        
        
        bu.selected = NO;
        
    }
    
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    if (youzhi) {
        
        NSString * str = [user valueForKey:@"mimi"];
        
        if ([_mimi isEqualToString:str]) {
            NSLog(@"密码正确");
            
            [self.dekele tiaozhuan];
            
            
        }else{
            
            
            NSLog(@"密码错误");
            
        }
        
        
        
        
    }else{
        
        
        [user setValue:_mimi forKey:@"mimi"];
        
        NSLog(@"密码保存");
        
        [self.dekele baocunmima];
        
    }
    
    
    _mimi = [[NSMutableString alloc] init];
    
    [self setNeedsDisplay];
    _buttons = [NSMutableArray array];
    
}
-(void)drawRect:(CGRect)rect{
    
    CGContextRef xsyref = UIGraphicsGetCurrentContext();
    
    for(int i=0;i<_buttons.count;i++){
        
        UIButton * but = _buttons[i];
        
        if (i==0) {
            CGContextMoveToPoint(xsyref, but.center.x
                                 , but.center.y);
            
        }else{
            
            CGContextAddLineToPoint(xsyref, but.center.x
                                    , but.center.y);
           
        }
        
        
    }
    CGContextSetLineWidth(xsyref, 20);
    CGContextSetLineCap(xsyref, kCGLineCapRound);
    
    [[UIColor redColor]set];
    
    CGContextStrokePath(xsyref);
    
    
}



@end

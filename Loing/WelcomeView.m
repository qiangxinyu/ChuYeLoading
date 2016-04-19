//
//  WelcomeView.m
//  Loing
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "WelcomeView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
@implementation WelcomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        CGFloat width = 240.0/375*kScreenWidth;
        CGFloat height = width/800 * 1417 + 2;
        if (kScreenHeight == 480) {
            height = width/408 * 612;
        }
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight-height, width,height)];
        _imageView.center = CGPointMake(kScreenWidth/2, _imageView.center.y);
        [self addSubview:_imageView];
        
    }
    return self;
}


- (void)showLabel
{
    [self addSubview:self.bigLabel];
    [self addSubview:self.smallLabel];
    
    [UIView animateWithDuration:.4 animations:^{
        self.bigLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight/7);
        self.smallLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight/5);
    }];
}

- (void)hiddenLabel
{
    [self.bigLabel removeFromSuperview];
    [self.smallLabel removeFromSuperview];
    self.bigLabel.center = CGPointMake(-kScreenWidth/2, kScreenHeight/7);
    self.smallLabel.center = CGPointMake(kScreenWidth/2*3, kScreenHeight/5);
    self.imageView.userInteractionEnabled = YES;
}

- (void)addBtn
{
    self.experienceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_experienceBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    _experienceBtn.layer.cornerRadius = 5;
    _experienceBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _experienceBtn.layer.borderWidth = 1;
    _experienceBtn.frame = CGRectMake(0, 0, 100, 30);
    _experienceBtn.center = CGPointMake(self.imageView.frame.size.width/2, self.imageView.frame.size.height - 50);
    [self.imageView addSubview:_experienceBtn];
    
}



- (UILabel *)bigLabel
{
    if (!_bigLabel) {
        _bigLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, 40)];
        _bigLabel.center = CGPointMake(-kScreenWidth/2, kScreenHeight/7);
        _bigLabel.textColor = [UIColor whiteColor];
        _bigLabel.textAlignment = NSTextAlignmentCenter;
        _bigLabel.font = [UIFont systemFontOfSize:20];
    }
    return _bigLabel;
}

- (UILabel *)smallLabel
{
    if (!_smallLabel) {
        _smallLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, 40)];
        _smallLabel.center = CGPointMake(kScreenWidth/2*3, kScreenHeight/5);
        _smallLabel.textColor = [UIColor whiteColor];
        _smallLabel.textAlignment = NSTextAlignmentCenter;
        _smallLabel.font = [UIFont systemFontOfSize:13];
    }
    return _smallLabel;
}

@end

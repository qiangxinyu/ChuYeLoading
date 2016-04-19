//
//  WelcomeView.h
//  Loing
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeView : UIView
@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UILabel * bigLabel;
@property (nonatomic,strong)UILabel * smallLabel;

@property (nonatomic,strong)UIButton * experienceBtn;


- (void)showLabel;
- (void)hiddenLabel;


- (void)addBtn;

@end

//
//  ViewController.m
//  Loing
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#import "ViewController.h"
#import "WelcomeView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)UIImageView * backgroudImageView;
@property (nonatomic,strong)UIScrollView * scrollView;

@end

@implementation ViewController
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.backgroudImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    _backgroudImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newfeature-plus-bg" ofType:@"jpg"]];
    [self.view addSubview:_backgroudImageView];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(kScreenWidth * 5, kScreenHeight);
    [self.view addSubview:_scrollView];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    NSString * type = @"L";
    if (kScreenHeight == 480) {
        type = @"S";
    }
    
    
    NSArray * bigLabelArray = @[@"一分钟出品",@"可以社交啦",@"炫，就一个字",@"没事儿，刷初页",@"2.0版全新出发"];
    NSArray * smallLabelArray = @[@"老版本太费时？这次以批量选图，1分钟搞定",@"终于可以和感动你的人交朋友了",@"50种特技，100种板式，上千种动画组合",@"全屏浏览画面，把五百万画报故事装进你的口袋",@"为你而改变"];
    
    for (int i = 0 ; i < 5 ; i ++) {
        WelcomeView * welcomeView = [[WelcomeView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight)];
        welcomeView.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"0%d-%@",i+1,type] ofType:@"jpg"]];
        [_scrollView addSubview:welcomeView];
        welcomeView.bigLabel.text = bigLabelArray[i];
        welcomeView.smallLabel.text = smallLabelArray[i];
        welcomeView.tag = 100 + i;
        
        
        
        if (i == 0) {
            [welcomeView showLabel];
        }
        if (i == 4) {
            [welcomeView addBtn];
            [welcomeView.experienceBtn addTarget:self action:@selector(clickExperienceBtn) forControlEvents:UIControlEventTouchUpInside];
        }

    }
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 40.0/667 * kScreenHeight, kScreenWidth, 20)];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / kScreenWidth;
    self.pageControl.currentPage = index;
    
    WelcomeView * welcomeView = (WelcomeView *)[scrollView viewWithTag:100 + index];
    [welcomeView showLabel];
    
    welcomeView = (WelcomeView *)[scrollView viewWithTag:100 + index + 1];
    [welcomeView hiddenLabel];
    
    welcomeView = (WelcomeView *)[scrollView viewWithTag:100 + index - 1];
    [welcomeView hiddenLabel];
}

- (void)clickExperienceBtn
{
    [self.scrollView removeFromSuperview];
    [self.backgroudImageView removeFromSuperview];
    [self.pageControl removeFromSuperview];
}


@end

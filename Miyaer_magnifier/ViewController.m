//
//  ViewController.m
//  Miyaer_magnifier
//
//  Created by miya on 16/7/19.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "ViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#import "NextViewController.h"
@interface ViewController ()
{
    UIScrollView * scrollView;
}

@end

@implementation ViewController

- (void)createUI{
    scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(5*WIDTH, HEIGHT);
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.pagingEnabled = YES;
    for (int i =0; i<10; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, HEIGHT)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"43_%d.jpg",i+1]];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
        [scrollView addSubview:imageView];
        
    }
    [self.view addSubview:scrollView];
}

- (void)tapClick:(UITapGestureRecognizer *)tgr{
    UIImageView * imageView = (UIImageView *)tgr.view;
    NextViewController *vc = [[NextViewController alloc]init];
    vc.imageName = imageView.image;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"放大镜";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

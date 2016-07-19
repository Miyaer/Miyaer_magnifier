//
//  NextViewController.m
//  Miyaer_magnifier
//
//  Created by miya on 16/7/19.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * superView = [[UIView alloc]initWithFrame:self.view.frame];
    superView.userInteractionEnabled = YES;
    superView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:superView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTapsRequired = 2;
    [superView addGestureRecognizer:tap];
    UIView * ringView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    ringView.userInteractionEnabled = YES;
    ringView.backgroundColor = [UIColor redColor];
    UIPanGestureRecognizer * pgr = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pgrClick:)];
    [ringView addGestureRecognizer:pgr];
    
    ringView.layer.masksToBounds = YES;
    ringView.layer.cornerRadius = 100;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.tag = 99;
    //超出父视图的部分剪切掉
    imageView.clipsToBounds = YES;
    imageView.image = self.imageName;
    [ringView addSubview:imageView];
    [superView addSubview:ringView];
    
}
- (void)pgrClick:(UIPanGestureRecognizer *)pgr{
    UIImageView * imageView = (UIImageView*)[self.view viewWithTag:99];
    //计算手势所在视图上的位置
    CGPoint point = [pgr translationInView:self.view];
    
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        
        center = pgr.view.center;
        
    }
    //新位置=原来的坐标位置+手指移动的位置
    pgr.view.center = CGPointMake(point.x+center.x, point.y+center.y);
    //图片的位移根据放大镜的位移改变，图片相对于放大镜始终保持在整个窗口的位置
    imageView.frame = CGRectMake(0-pgr.view.center.x+100, 0-pgr.view.center.y+100, self.view.frame.size.width, self.view.frame.size.height);
    
}
- (void)tapClick:(UITapGestureRecognizer *)tap{
    [self dismissViewControllerAnimated:YES completion:nil];
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

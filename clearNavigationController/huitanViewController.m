//
//  huitanViewController.m
//  clearNavigationController
//
//  Created by 中为 on 16/8/27.
//  Copyright © 2016年 xx. All rights reserved.
//

#import "huitanViewController.h"

@interface huitanViewController ()
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleViewTopSpaceLayout;

@property (weak, nonatomic) IBOutlet UIView *middleView;

@property(nonatomic,assign)CGRect rect1;


@end
@implementation huitanViewController
{
    CGFloat middleViewTopSpaceLayoutConstant;
    CGFloat middleViewOriginY;
    CGFloat yy;
    CGFloat aa;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    [self.panGesture addTarget:self action:@selector(pan)];
    middleViewTopSpaceLayoutConstant = self.middleViewTopSpaceLayout.constant;
    middleViewOriginY = self.middleView.frame.origin.y;
    _rect1 = self.middleView.frame;
    
    UIView* view = [[UIView alloc]initWithFrame:self.middleView.frame];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}

- (void)pan{
    
    if (self.panGesture.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.34 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.middleView.frame = _rect1;
            
        } completion:^(BOOL finished) {
            if (finished) {
                //设置向上的约束的改变
//               self.middleViewTopSpaceLayout.constant = middleViewTopSpaceLayoutConstant;
                NSLog(@"***%f  %f  %f  %f",self.middleView.frame.origin.x,self.middleView.frame.origin.y,self.middleView.frame.size.width,self.middleView.frame.size.height);
            }
            return;
        }];
    }
    yy = [self.panGesture translationInView:self.view].y;
    self.middleViewTopSpaceLayout.constant = middleViewTopSpaceLayoutConstant + yy;
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

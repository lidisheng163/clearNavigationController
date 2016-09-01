//
//  myTestViewController.m
//  clearNavigationController
//
//  Created by 中为 on 16/8/27.
//  Copyright © 2016年 xx. All rights reserved.
//

#import "myTestViewController.h"

@interface myTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation myTestViewController
{
    UIView* view;
    CGRect rect;
    float yy;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setNavigationBar];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 80)];
    view.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:view];
    rect = view.frame;
//    [self testView];
    
    UIView* v = [[UIView alloc]initWithFrame:self.button.frame];
    v.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:v];
    
}

- (void)testView{
    
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect1 = rect;
        rect1.origin.y += 200;//动画播放时到达的位置
        view.frame = rect1;
    } completion:^(BOOL finished) {
        if (finished) {
            view.frame = rect;
        }
        return;
    }];
    
}


- (void)setNavigationBar{
    
//    self.edgesForExtendedLayout = UIRectEdgeAll;
//    self.navigationController.navigationBar.translucent = true;
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *clearImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:clearImage forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = clearImage;
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    iOS7以前：
//    
//    tintColor：设置navigationBar和navigationItem的颜色，navigationItem里面的字体默认为白色，
//    iOS7之后（新增barTintColor属性）：
//    
//    tintColor：不再是以前的设置navigationBar和navigationItem的颜色，而是变成了只修改navigationItem里面的字体颜色。
//    
//    barTintColor：设置navigationBar和navigationItem的颜色，由于iOS7的navigationItem以文字的方式体现，默认为蓝色，
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

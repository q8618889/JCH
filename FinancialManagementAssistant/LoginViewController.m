//
//  LoginViewController.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/12.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
@interface LoginViewController ()
{
    UIImageView * _Simage;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    [self createButton];

}
-(void)createNav
{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((MAINSCREEN_WIDTH-223/1.5)/2, 150, 223/1.5, 109/1.5)];
    imageView.image = [UIImage imageNamed:@"logo@3x.png"];
    [self.view addSubview:imageView];
    UIImageView *loginT = [[UIImageView alloc] initWithFrame:CGRectMake((MAINSCREEN_WIDTH-300)/2, 250, 600/2, 190/2)];
    loginT.image = [UIImage imageNamed:@"login@3x.png"];
    [self.view addSubview:loginT];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((MAINSCREEN_WIDTH-300)/2, 360, 600/2, 95/2);
    btn.backgroundColor = BCOLOR;
    [btn addTarget:self action:@selector(PbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 7;
    [btn setTitle:@"登陆" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:btn];
    for (int i = 0 ; i < 2; i++)
    {
        UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake((MAINSCREEN_WIDTH - 300)/2+40, i==0?253:297, 600/2-40, 95/2)];
        tf.backgroundColor = [UIColor clearColor];
        if (i == 0)
        {
            tf.placeholder = @"输入账号";
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        }else{
            tf.placeholder = @"输入密码";
            tf.clearButtonMode = UITextFieldViewModeWhileEditing;
            tf.secureTextEntry = YES;
        }
        [self.view addSubview:tf];
    }
    
}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(MAINSCREEN_WIDTH - 160, 410, 150, 40);
    [btn addTarget:self action:@selector(SbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.selected = NO;
    [btn setTitleColor:BCOLOR forState:0];
    [btn setTitle:@"记住我" forState:0];
    _Simage = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-145, 417, 25, 25)];
    _Simage.image = [UIImage imageNamed:@"tick2@3x.png"];
    [self.view addSubview:_Simage];
    [self.view addSubview:btn];
}
-(void)SbtnClick:(UIButton *)btn
{
    if (btn.selected == NO)
    {
        _Simage.image = [UIImage imageNamed:@"tick2@3x.png"];
        btn.selected = YES;
    }else{
        _Simage.image = [UIImage imageNamed:@"tick@3x.png"];
        btn.selected = NO;
    }
}
-(void)PbuttonClick:(UIButton *)btn
{
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [nav.navigationBar setHidden:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.3];
    [UIView setAnimationTransition:104 forView:[UIApplication sharedApplication].delegate.window cache:YES];
    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
    [UIView commitAnimations];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

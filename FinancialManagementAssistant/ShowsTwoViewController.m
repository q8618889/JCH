//
//  ShowsTwoViewController.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/15.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "ShowsTwoViewController.h"
#import "XLineTableViewCell.h"
@interface ShowsTwoViewController ()
{
    UITableView * _myTableView;
}

@end

@implementation ShowsTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLineCell];
    [self createBView];
}
-(void)createBView
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 64)];
    image.userInteractionEnabled = YES;
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH/2-20, 20, 150, 40)];
    lab.text  =@"详细";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BBCCOLOR;
    [image addSubview:lab];
    [self.view addSubview:image];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 28, 25, 25);
    [btn setBackgroundImage:[UIImage imageNamed:@"AL.png"] forState:UIControlStateNormal];
    btn.tag = 1;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image  addSubview:btn];
    
    
}
-(void)createLineCell
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT-40) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    XLineTableViewCell * xl = [[XLineTableViewCell alloc]initWithYear:_year];
    xl.year = _year;
    xl.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([indexPath row] == 0)
    {
        xl.backgroundColor = BBCCOLOR;
        xl.number.text = @"成人调理";
    }
    if ([indexPath row] == 1)
    {
        xl.BEMSimplelines.colorLine = BCCOLOR;
        xl.price.textColor = BCCOLOR;
        xl.backgroundColor = BCOLOR;
        xl.number.textColor = BCCOLOR;
        xl.number.text = @"儿童调理";
    }
    if ([indexPath row] == 2)
    {
        xl.BEMSimplelines.colorLine =BCCOLOR ;
        xl.BEMSimplelines.colorXaxisLabel = BCCOLOR;
        xl.price.textColor = BCCOLOR;
        xl.backgroundColor = BBCOLOR;
        xl.number.textColor = BCCOLOR;
        xl.number.text = @"中药理疗";
    }
    if ([indexPath row] == 3)
    {
        xl.BEMSimplelines.colorLine = BCOLOR;
        xl.BEMSimplelines.colorXaxisLabel = BCOLOR;
        xl.price.textColor = BCOLOR;
        xl.backgroundColor = BCCOLOR;
        xl.number.textColor = BCOLOR;
        xl.number.text = @"特色理疗";
    }
    return xl;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone6)
    {
        return 185+18;
    }
    if (iPhone6P)
    {
        return 207+18;
    }else{
        return 185+18;
    }
}
-(void)buttonClick:(UIButton *)btn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

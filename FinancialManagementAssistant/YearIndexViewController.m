//
//  YearIndexViewController.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "YearIndexViewController.h"
#import "MFJChartTableViewCell.h"
#import "SmallTableViewCell.h"
#import "LineIndexTableViewCell.h"
@interface YearIndexViewController ()
{
    UITableView             *_myTableView;
    NSMutableArray          * _dataArray;
    NSMutableArray          * _dataArray2;
}

@end

@implementation YearIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc]initWithObjects:@"8000",@"5000",@"6000",@"1000",@"7000", nil];
    _dataArray2 = [[NSMutableArray alloc]initWithObjects:@"3000",@"200",@"130",@"300",@"200", nil];
    
    [self createNav];
    [self createTableView];
   
    
}
-(void)createNav
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 64)];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH/2-50, 20, 200, 40)];
    image.userInteractionEnabled = YES;
    lab.text  =@"年度财务统计";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BCOLOR;
    [image addSubview:lab];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 28, 40, 30);
    [btn setTitle:@"返回" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(blackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [image addSubview:btn];
    [self.view addSubview:image];

}
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _myTableView.delegate =self;
    _myTableView.dataSource =self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
#pragma mark- button
-(void)blackButtonClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row ] == 2)
    {
        MFJChartTableViewCell * mfj = [[MFJChartTableViewCell alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 300)With:_dataArray With2:_dataArray2 WithBool:YES];
        mfj.selectionStyle = UITableViewCellSelectionStyleNone;

        return mfj;
    }
    if ([indexPath row] == 1)
    {
        SmallTableViewCell * scell = [[SmallTableViewCell alloc]initWith:YES];
        scell.selectionStyle = UITableViewCellSelectionStyleNone;

        return scell;
    }else{
        LineIndexTableViewCell * lcell = [[LineIndexTableViewCell alloc]init];
        lcell.selectionStyle = UITableViewCellSelectionStyleNone;

        return lcell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 2)
    {
        return 400;
    }
    else if([indexPath row]==0)
    {
        return 200;
    }else{
        return 40;
    }
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

//
//  MonthIndexViewController.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "MonthIndexViewController.h"
#import "MFJChartTableViewCell.h"
#import "SmallTableViewCell.h"
#import "MonthIndexTableViewCell.h"
@interface MonthIndexViewController ()
{
        UITableView             *_myTableView;
    NSMutableArray              * _dataArray;
    NSMutableArray              * _dataArray2;
    UILabel                     *_dateLabel;
    NSInteger                   _year;
    NSInteger                   _month;
    NSInteger                   _NewYear;
    NSInteger                   _NewMonth;
    

    
}

@end

@implementation MonthIndexViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc]initWithObjects:@"80",@"50",@"60",@"100",@"70",@"80",@"50",@"60",@"100",@"70",@"80",@"50", nil];
    _dataArray2 = [[NSMutableArray alloc]initWithObjects:@"30",@"20",@"13",@"30",@"20",@"30",@"20",@"13",@"30",@"20",@"30",@"20", nil];
    [self setDate];
    [self createNav];
    [self createTableView];
    
    
}
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year       = [dateComponent year];
    _month      = [dateComponent month];
    _NewYear    = _year;
    _NewMonth   = _month;
}
-(void)createNav
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 64+40)];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH/2-50, 20, 200, 40)];
    image.userInteractionEnabled = YES;
    lab.text  =@"月度财务统计";
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
    UIButton * left = [UIButton buttonWithType:UIButtonTypeCustom];
    left.frame = CGRectMake(10, 70, 30, 30);
    [left setBackgroundImage:[UIImage imageNamed:@"AL.png"] forState:UIControlStateNormal];
    left.tag = 1;
    [left addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image  addSubview:left];
    UIButton * right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(MAINSCREEN_WIDTH-10-25, 70, 30, 30);
    [right setBackgroundImage:[UIImage imageNamed:@"AR.png"] forState:UIControlStateNormal];
    right.tag = 2;
    [right addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image  addSubview:right];
    [self.view addSubview:image];
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake((MAINSCREEN_WIDTH-150)/2+50,64, 150, 40)];
    _dateLabel.alpha = 0.7;
    _dateLabel.text = [NSString stringWithFormat:@"%ld年",(long)_year];
    _dateLabel.textColor = [UIColor whiteColor];
    [image addSubview:_dateLabel];
    
}
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT-64-40) style:UITableViewStylePlain];
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
        MFJChartTableViewCell * mfj = [[MFJChartTableViewCell alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 300)With:_dataArray With2:_dataArray2 WithBool:NO];
        mfj.selectionStyle = UITableViewCellSelectionStyleNone;

        return mfj;
    }
    if ([indexPath row] == 1)
    {
        SmallTableViewCell * sm = [[SmallTableViewCell alloc]initWith:NO];
        sm.selectionStyle = UITableViewCellSelectionStyleNone;

        return sm;
    }else{
        MonthIndexTableViewCell * mi = [[MonthIndexTableViewCell alloc]initWith:_dateLabel.text];
        mi.selectionStyle = UITableViewCellSelectionStyleNone;

        return mi;
    }
   
 
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 2)
    {
        return 800;
    }
    else if([indexPath row]==0)
    {
        return 200;
    }else{
        return 40;
    }
}
-(void)buttonClick:(UIButton *)btn
{
    if (btn.tag == 2)
    {
        if (_year == _NewYear)
        {
            return;
        }
        _year++;
        _dateLabel.text = [NSString stringWithFormat:@"%ld年",(long)_year];
    }else{
        
        _year--;
        _dateLabel.text = [NSString stringWithFormat:@"%ld年",(long)_year];
    }
    [_myTableView reloadData];
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

//
//  FinanclalViewController.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "FinanclalViewController.h"
#import "ShowsViewController.h"
#import "LoginViewController.h"
#import "YearIndexViewController.h"
#import "MonthIndexViewController.h"
#import "CBStoreHouseRefreshControl.h"
@interface FinanclalViewController ()
{
    CGFloat     _width;
    CGFloat     _height;
    NSInteger   _year;
    NSString  * _weeked;
    NSString  * _monthed;
    NSString  * _dayed;
    
}
@end

@implementation FinanclalViewController
- (void)viewDidAppear:(BOOL)animated;
{
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:777];
    [UIView animateWithDuration:0.1 animations:^{
        view.frame = CGRectMake(0, MAINSCREEN_HEIGHT-49, MAINSCREEN_WIDTH, 49);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
//    获取屏幕的物理尺寸
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    [self.navigationController.navigationBar setHidden:YES];
//    创建表
    [self createTableView];
    [self createNav];
//    当前日期
    [self setDate];
    
    
}
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year = [dateComponent year];
    NSInteger   month = [dateComponent month];
    NSInteger   day   = [dateComponent day];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"Sunday", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendare = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone  = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendare setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendare components:calendarUnit fromDate:now];
   _weeked =[weekdays objectAtIndex:theComponents.weekday];
    if (month<10)
    {
        _monthed = [NSString stringWithFormat:@"0%ld",month];
    }else{
        _monthed = [NSString stringWithFormat:@"%ld",month];
    }
    if (day<10)
    {
        _dayed = [NSString stringWithFormat:@"0%ld",day];
    }else{
        _dayed = [NSString stringWithFormat:@"%ld",day];
    }
}
#pragma mark- Nav
-(void)createNav
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, 64)];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(_width/2-76, 20, 200, 40)];
    image.userInteractionEnabled = YES;
    lab.text  =@"经禅和财务管理助手";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BCOLOR;
    [image addSubview:lab];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(MAINSCREEN_WIDTH-40, 28, 25, 25);
    [btn setBackgroundImage:[UIImage imageNamed:@"exit@3x.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(exitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image addSubview:btn];
    [self.view addSubview:image];
}
#pragma mark- myTableView
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64-49) style:UITableViewStylePlain];
    _myTableView.delegate =self;
    _myTableView.dataSource =self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _myTableView.backgroundColor = BCOLOR;
    self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self.myTableView target:self refreshAction:@selector(refreshTriggered:) plist:@"AKTA" color:[UIColor whiteColor] lineWidth:1.5 dropHeight:80 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
    [self.view addSubview:_myTableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}
#warning TableView数据无________________________________________
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    if ([indexPath row] == 0)
    {
//         富文本排版方法内容在Cell里
        OneTableViewCell * oneCell = [[OneTableViewCell alloc]init];
        oneCell.lab_Today.text = [NSString stringWithFormat:@"<font face=GillSans size=13 color='#8E8E8E'>今日 %ld-%@-%@ %@</font>",(long)_year,_monthed,_dayed,_weeked];
        
        [oneCell.lab_Price setText:@"<font face='HelveticaNeue' size=25 color='#71C6E8'>¥</font><font face=GillSans size=45 color='#71C6E8'>6688 font</font>"];
        [oneCell.lab_Bargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=23 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font>"];
        [oneCell.lab_Countermand setText:@"<font face='HelveticaNeue' size=13 color='#8E8E8E'>退单</font><font face=GillSans size=18 color='#71C6E8'>7</font><font face='HelveticaNeue' size=13 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=13 color='#8E8E8E'>退单率</font><font face=GillSans size=18 color='#71C6E8'>7.0%</font>"];
        oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return oneCell;
    }else if ([indexPath row] == 1){
        TwoTableViewCell * tCell = [[TwoTableViewCell alloc]init];
        tCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return tCell;
        
    }else if ([indexPath row] == 2)
    {
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"近七日";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        treeCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return treeCell;
    }else if ([indexPath row] == 3){
        FourTableViewCell * fCell = [[FourTableViewCell alloc]init];
        fCell.titles.text = @"月度统计";
        fCell.titles.textColor = [UIColor whiteColor];
        fCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return fCell;
    }else if ([indexPath row] == 4){
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"当月";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        treeCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return treeCell;
    }else if ([indexPath row] == 5){
        FourTableViewCell * fCell = [[FourTableViewCell alloc]init];
        fCell.titles.text = @"年度统计";
        fCell.titles.textColor = [UIColor whiteColor];
        fCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return fCell;
        
    }else
    {
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"今年";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        treeCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return treeCell;

    }
    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==5)
    {
        YearIndexViewController * yv = [[YearIndexViewController alloc]init];
        [yv.navigationController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:yv animated:YES];
        [self tabbarA];
    }
    if ([indexPath row] ==3)
    {
        MonthIndexViewController * mvc = [[MonthIndexViewController alloc]init];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
        [self tabbarA];

    }
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
#pragma mark- heightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] == 0)
    {
        return 120;
    }else if ([indexPath row] == 1){
        return 200;
    }else if ([indexPath row] == 2){
        return 80;
    }else if ([indexPath row] == 3){
        return 44;
    }else if ([indexPath row] == 4){
        return 80;
    }else if ([indexPath row] == 5){
        return 44;
    }else if ([indexPath row] == 6){
        return 80;
    }
    return 0;
}
-(void)exitButtonClick:(UIButton *)btn
{
    LoginViewController * login = [[LoginViewController alloc]init];
  UIView * view =  [[UIApplication sharedApplication].delegate.window viewWithTag:777];
    [view removeFromSuperview];
    [UIApplication sharedApplication].delegate.window.rootViewController = login;
}
-(void)tabbarA
{
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:777];
    [UIView animateWithDuration:1 animations:^{
        view.frame = CGRectMake(0, MAINSCREEN_HEIGHT, MAINSCREEN_WIDTH, 49);
    }];
}
#pragma mark - Notifying refresh control of scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}

#pragma mark - Listening for the user to trigger a refresh

- (void)refreshTriggered:(id)sender
{
    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
}

- (void)finishRefreshControl
{
    [_myTableView reloadData];
    [self.storeHouseRefreshControl finishingLoading];
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

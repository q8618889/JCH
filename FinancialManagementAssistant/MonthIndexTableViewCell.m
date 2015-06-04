//
//  MonthIndexTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/15.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "MonthIndexTableViewCell.h"

@implementation MonthIndexTableViewCell
{
    NSInteger   _year;
    NSMutableArray                 * _dateArray;
    NSMutableArray      * _array;
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWith:(NSString *)year;
{
    self = [super init];
    if (self) {
        
        _dataArray = [[NSArray alloc]init];
        _dateArray = [[NSMutableArray alloc]init];
        _array = [NSMutableArray array];
         _year = year.integerValue;

        [self createBEM];
        _price =[[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-200, 10, 200, 20)];
        _price.textColor = BBCOLOR;
        _price.textAlignment = NSTextAlignmentRight;
        [self addSubview:_price];
        UILabel * Bprice =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
        Bprice.textColor = BCOLOR;
        Bprice.text = @"每月订单收益";
        [self addSubview:Bprice];
        _price.text =[NSString stringWithFormat:@"%ld年%@月%@元",(long)_year,[_dateArray objectAtIndex:0],[_dataArray objectAtIndex:0]];
        
    }
    return self;
}
-(void)createBEM
{
    _dataArray = @[@"1200",@"1900",@"3000",@"1000",@"1800",@"1200",@"1900",@"3000",@"1000",@"1800",@"1200",@"1900",];
    for (NSInteger i = 1; i<13; i++)
    {
        [_dateArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    if (isRetina||iPhone5)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 280, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor clearColor];
        _BEMSimplelines.colorXaxisLabel = BCOLOR;
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = BCOLOR;
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
        
    }
    if (iPhone6)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 325, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor clearColor];
        _BEMSimplelines.colorXaxisLabel = BCOLOR;
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = BCOLOR;
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
    }
    if (iPhone6P)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 365, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor clearColor];
        _BEMSimplelines.colorXaxisLabel = BCOLOR;
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = BCOLOR;
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
    }
    
    
    
}

- (int)numberOfPointsInGraph;
{
    return (int)[_dataArray count];
}
- (float)valueForIndex:(NSInteger)index;
{
    return [[_dataArray objectAtIndex:index] floatValue];
}
-(int)numberOfGapsBetweenLabels
{
    return 0;
}
-(NSString *)labelOnXAxisForIndex:(NSInteger)index
{
    return [_dateArray objectAtIndex:index];
}

-(void)didTouchGraphWithClosestIndex:(int)index
{
    _price.text =[NSString stringWithFormat:@"%ld年%@月%@元",_year,[_dateArray objectAtIndex:index],[_dataArray objectAtIndex:index]];
    
}
@end

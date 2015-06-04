//
//  LineIndexTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "LineIndexTableViewCell.h"

@implementation LineIndexTableViewCell{
    NSInteger   _year;
    NSMutableArray                 * _dateArray;
    NSMutableArray      * _array;
}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _dataArray = [[NSArray alloc]init];
        _dateArray = [[NSMutableArray alloc]init];
        _array = [NSMutableArray array];
          [self setDate];
        [self createBEM];
        _price =[[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-200, 10, 200, 20)];
        _price.textColor = BBCOLOR;
        _price.textAlignment = NSTextAlignmentRight;
        [self addSubview:_price];
        UILabel * Bprice =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
        Bprice.textColor = BCOLOR;
        Bprice.text = @"每年订单收益";
        [self addSubview:Bprice];

        _price.text =[NSString stringWithFormat:@"%ld年%@元",(long)_year,[_dataArray objectAtIndex:0]];
        
    }
    return self;
}
-(void)createBEM
{
    _dataArray = @[@"12",@"1900000",@"300000",@"100000",@"1800000"];
    for (NSInteger i = 0; i<5; i++)
    {
        [_dateArray addObject:[NSString stringWithFormat:@"%ld",_year - i]];
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
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year = [dateComponent year];
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
    NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    return [array objectAtIndex:index];
}

-(void)didTouchGraphWithClosestIndex:(int)index
{
     NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    _price.text =[NSString stringWithFormat:@"%@年%@元",[array objectAtIndex:index],[_dataArray objectAtIndex:index]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

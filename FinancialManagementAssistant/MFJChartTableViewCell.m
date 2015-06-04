//
//  MFJChartTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "MFJChartTableViewCell.h"

@implementation MFJChartTableViewCell
{

}

- (void)awakeFromNib {
    
}
- (instancetype)initWithFrame:(CGRect)frame With:(NSMutableArray *)array With2:(NSMutableArray *)array2 WithBool:(BOOL)isYear;
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataAray = array;
        _dataAray2 = array2;
        NSComparator cmptr = ^(id obj1, id obj2){
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        };
        NSArray * array3 =  [_dataAray arrayByAddingObjectsFromArray:_dataAray2];
        NSArray *array4 = [array3 sortedArrayUsingComparator:cmptr];
        NSString *max = [array4 lastObject];
        if (isYear == YES)
        {
            _mfj = [[MFJChart alloc]initWithFrame:CGRectMake(0, 0,MAINSCREEN_WIDTH-130, 400)];
            _mfj.MaxPrice = max.floatValue;
            _mfj.isYear   = isYear;
            [_mfj createSmallView:_dataAray with:_dataAray2];
            [self addSubview:_mfj];
        }else{
            _mfj = [[MFJChart alloc]initWithFrame:CGRectMake(0, 0,MAINSCREEN_WIDTH-130, 800)];
            _mfj.MaxPrice = max.floatValue;
            _mfj.isYear = isYear;
            [_mfj createSmallView:_dataAray with:_dataAray2];
            [self addSubview:_mfj];
        }
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

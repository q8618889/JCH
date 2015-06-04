//
//  MFJChart.m
//  NumberLong
//
//  Created by MAXMFJ on 15/2/13.
//  Copyright (c) 2015年 MAX-MENGFANJIE. All rights reserved.
//

#import "MFJChart.h"


@implementation MFJChart
{
    NSInteger   _year;
    CGFloat _ViewWidth;
    NSArray * _dataArray2;
    NSMutableArray * _array;
}
- (instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        初始化view大小
        _ViewWidth = frame.size.width;
        _array = [NSMutableArray array];
        [self setDate];
        
    }
    return self;
}
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year = [dateComponent year];
}
-(void)createSmallView:(NSArray *)dataArray with:(NSArray *)dataArray2;
{
    
//   计算高度间隔
    CGFloat  widthJG = self.frame.size.height/[dataArray count];
    for (NSInteger  i = 0; i <[dataArray count]; i++)
    {
        NSString * widthValuesStr = [dataArray objectAtIndex:i];
        NSString * widthValuesStr2 =[dataArray2 objectAtIndex:i];
        CGFloat widthValues = widthValuesStr.floatValue/_MaxPrice *self.frame.size.width;
        if (widthValues < 1)
        {
            widthValues = 0.9;
        }
        CGFloat widthValues2 = widthValuesStr2.floatValue/_MaxPrice *self.frame.size.width;
        if (widthValues2 <1)
        {
            widthValues2 = 0.9;
        }
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x+60,20+widthJG * i,0, 15)];
        view.backgroundColor  = BCOLOR;
        [self addSubview:view];
        
        UIView * sView= [[UIView alloc]initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+20,0, 15)];
        sView.backgroundColor = BBCOLOR;
        [self addSubview:sView];
        if (_isYear == YES)
        {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 20+widthJG * i, 60, 20)];
            lab.text = [NSString stringWithFormat:@"%ld",_year - i];
            lab.textColor = BCOLOR;
            [self addSubview:lab];
        }else{
            for (NSInteger i = 0; i<12; i++)
            {
                UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20+widthJG * i, 50, 20)];
                lab.text = [NSString stringWithFormat:@"%ld",i+1];
                lab.textAlignment =  NSTextAlignmentRight;
                lab.textColor = BCOLOR;
                [self addSubview:lab];
            }
        }
        
        UILabel * Blab = [[UILabel alloc]initWithFrame:CGRectMake(widthValues+65, 20+widthJG *i, 60, 15)];
        Blab.alpha = 0;
        Blab.text = [NSString stringWithFormat:@"%@",[dataArray objectAtIndex:i]];
        Blab.textColor = BCOLOR;
        [self addSubview:Blab];
        UILabel * Slab = [[UILabel alloc]initWithFrame:CGRectMake(widthValues2+65, 20+widthJG *i+20, 60, 15)];
        Slab.alpha = 0;
        Slab.text = [NSString stringWithFormat:@"%@",[dataArray2 objectAtIndex:i]];
        Slab.textColor = BCOLOR;
        [self addSubview:Slab];
        [UIView animateWithDuration:1.5 animations:^{
            view.frame = CGRectMake(self.frame.origin.x+60,20+widthJG * i,widthValues, 15);
            sView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y+20,widthValues2, 15);
        } completion:^(BOOL finished) {
           [UIView animateWithDuration:1.5 animations:^{
               Blab.alpha = 1;
               Slab.alpha = 1;
           }];
        }];
 
       
    
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

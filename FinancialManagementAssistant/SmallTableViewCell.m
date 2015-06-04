//
//  SmallTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "SmallTableViewCell.h"

@implementation SmallTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWith:(BOOL)isYear;
{
    self = [super init];
    if (self) {
        _isYear = isYear;
        [self createLabel];
    }
    return self;
}
-(void)createLabel
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-200 , 12, 15, 15)];
    view.backgroundColor = BCOLOR;
    [self addSubview:view];
    UIView * views = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-120 , 12, 15, 15)];
    views.backgroundColor = BCCOLOR;
    [self addSubview:views];
    UILabel * Bprice =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
    Bprice.textColor = BCOLOR;
    if (_isYear == YES)
    {
        Bprice.text = @"每年订单数量";

    }else{
        Bprice.text = @"每月订单数量";

    }
    [self addSubview:Bprice];

    RTLabel * lab = [[RTLabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-180, 10, MAINSCREEN_WIDTH, 20)];
    [lab setText:@"<font face='HelveticaNeue-Bold' size=13 color='#8E8E8E'>成功交易     </font>  <font face='HelveticaNeue-Bold' size=13 color='#8E8E8E'>取消交易 </font><font face=HelveticaNeue-Bold size=13 color='#71C6E8'>单位:个</font></font>"];
    [self addSubview:lab];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

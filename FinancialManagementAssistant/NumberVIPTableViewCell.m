//
//  NumberVIPTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/13.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "NumberVIPTableViewCell.h"

@implementation NumberVIPTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createLabel];
    }
    return self;
}
-(void)createLabel
{
    _titles = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, 150, 30)];
    _titles.textColor = BBCOLOR;
    [_titles setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [self addSubview:_titles];
    _labOne = [[RTLabel alloc]initWithFrame:CGRectMake(25, 45, MAINSCREEN_WIDTH - 110, 30)];
    [self addSubview:_labOne];
    _labTwo = [[RTLabel alloc]initWithFrame:CGRectMake(25, 75, MAINSCREEN_WIDTH- 110, 60)];
    [self addSubview:_labTwo];
    _labThree = [[RTLabel alloc]initWithFrame:CGRectMake(25, 135, MAINSCREEN_WIDTH-110, 60)];
    [self addSubview:_labThree];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

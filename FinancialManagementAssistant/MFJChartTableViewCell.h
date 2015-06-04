//
//  MFJChartTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFJChart.h"
@interface MFJChartTableViewCell : UITableViewCell
- (instancetype)initWithFrame:(CGRect)frame With:(NSMutableArray *)array With2:(NSMutableArray *)array2 WithBool:(BOOL)isYear;
@property (nonatomic,retain)MFJChart * mfj;
@property (nonatomic,retain)NSMutableArray * dataAray;
@property (nonatomic,retain)NSMutableArray * dataAray2;
@end

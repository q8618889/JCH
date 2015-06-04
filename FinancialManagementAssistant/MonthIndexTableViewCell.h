//
//  MonthIndexTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/15.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthIndexTableViewCell : UITableViewCell<BEMSimpleLineGraphDelegate>
- (instancetype)initWith:(NSString *)year;

@property (nonatomic,retain)NSArray          * dataArray;
@property (nonatomic,retain)BEMSimpleLineGraphView  * BEMSimplelines;
@property (nonatomic,retain)UILabel                 * price;


@end

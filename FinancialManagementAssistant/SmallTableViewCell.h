//
//  SmallTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/14.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallTableViewCell : UITableViewCell
- (instancetype)initWith:(BOOL)isYear;

@property (nonatomic,assign)BOOL    isYear;
@end

//
//  MFJChart.h
//  NumberLong
//
//  Created by MAXMFJ on 15/2/13.
//  Copyright (c) 2015年 MAX-MENGFANJIE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFJChart : UIView
@property (nonatomic,retain)NSArray * dataArray;
@property (nonatomic,assign)CGFloat   MaxPrice;
@property (nonatomic,assign)BOOL        isYear;
-(void)createSmallView:(NSArray *)dataArray with:(NSArray *)dataArray2;
@end

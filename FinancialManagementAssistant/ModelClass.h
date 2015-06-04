//
//  ModelClass.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/28.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^DATAARRAY)(NSMutableArray  * array,NSString       * error);
@interface ModelClass : NSObject
+(void)FinancialManageGET:(NSString *)GET block:(DATAARRAY)block;
@end

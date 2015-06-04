//
//  ModelClass.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/28.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "ModelClass.h"
#import "AFNetworking.h"
#import "BaseClass.h"
@implementation ModelClass
+(void)FinancialManageGET:(NSString *)GET block:(DATAARRAY)block;
{
    AFHTTPRequestOperationManager * manager   = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    NSMutableArray       * dataArray = [NSMutableArray array];
//    [manager setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *json = operation.responseString;
//        NSData* data=[json dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        BaseClass * bc = [[BaseClass alloc]initWithDictionary:dic];
//        [dataArray addObject:bc];
//        block(dataArray,nil);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:manager];
 [manager GET:GET parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//     BaseClass * bc = [[BaseClass alloc]initWithDictionary:responseObject];
//     [dataArray addObject:bc];
     NSLog(@"%@",responseObject);
     block(dataArray,nil);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     
 }];
}
@end

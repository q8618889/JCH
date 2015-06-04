//
//  BaseClass.m
//
//  Created by   on 15/4/1
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "DataList.h"


NSString *const kBaseClassData = @"data";
NSString *const kBaseClassErrMsg = @"err_msg";
NSString *const kBaseClassSuccessMsg = @"success_msg";
NSString *const kBaseClassDataList = @"data_list";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize data = _data;
@synthesize errMsg = _errMsg;
@synthesize successMsg = _successMsg;
@synthesize dataList = _dataList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.data = [self objectOrNilForKey:kBaseClassData fromDictionary:dict];
            self.errMsg = [self objectOrNilForKey:kBaseClassErrMsg fromDictionary:dict];
            self.successMsg = [self objectOrNilForKey:kBaseClassSuccessMsg fromDictionary:dict];
    NSObject *receivedDataList = [dict objectForKey:kBaseClassDataList];
    NSMutableArray *parsedDataList = [NSMutableArray array];
    if ([receivedDataList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDataList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDataList addObject:[DataList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDataList isKindOfClass:[NSDictionary class]]) {
       [parsedDataList addObject:[DataList modelObjectWithDictionary:(NSDictionary *)receivedDataList]];
    }

    self.dataList = [NSArray arrayWithArray:parsedDataList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kBaseClassData];
    [mutableDict setValue:self.errMsg forKey:kBaseClassErrMsg];
    [mutableDict setValue:self.successMsg forKey:kBaseClassSuccessMsg];
    NSMutableArray *tempArrayForDataList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dataList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDataList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDataList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDataList] forKey:kBaseClassDataList];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.data = [aDecoder decodeObjectForKey:kBaseClassData];
    self.errMsg = [aDecoder decodeObjectForKey:kBaseClassErrMsg];
    self.successMsg = [aDecoder decodeObjectForKey:kBaseClassSuccessMsg];
    self.dataList = [aDecoder decodeObjectForKey:kBaseClassDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kBaseClassData];
    [aCoder encodeObject:_errMsg forKey:kBaseClassErrMsg];
    [aCoder encodeObject:_successMsg forKey:kBaseClassSuccessMsg];
    [aCoder encodeObject:_dataList forKey:kBaseClassDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.successMsg = [self.successMsg copyWithZone:zone];
        copy.dataList = [self.dataList copyWithZone:zone];
    }
    
    return copy;
}


@end

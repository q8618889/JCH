//
//  WebFileList.m
//
//  Created by   on 15/4/1
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WebFileList.h"


NSString *const kWebFileListUrl = @"url";
NSString *const kWebFileListSize = @"size";


@interface WebFileList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WebFileList

@synthesize url = _url;
@synthesize size = _size;


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
            self.url = [self objectOrNilForKey:kWebFileListUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kWebFileListSize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kWebFileListUrl];
    [mutableDict setValue:self.size forKey:kWebFileListSize];

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

    self.url = [aDecoder decodeObjectForKey:kWebFileListUrl];
    self.size = [aDecoder decodeObjectForKey:kWebFileListSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kWebFileListUrl];
    [aCoder encodeObject:_size forKey:kWebFileListSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    WebFileList *copy = [[WebFileList alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
    }
    
    return copy;
}


@end

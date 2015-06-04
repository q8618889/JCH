//
//  DataList.m
//
//  Created by   on 15/4/1
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DataList.h"
#import "WebFileList.h"


NSString *const kDataListId = @"id";
NSString *const kDataListCreateDate = @"create_date";
NSString *const kDataListSubType = @"sub_type";
NSString *const kDataListWebFileSize = @"web_file_size";
NSString *const kDataListAuthor = @"author";
NSString *const kDataListPublishDate = @"publish_date";
NSString *const kDataListWebFileUrl = @"web_file_url";
NSString *const kDataListBranchId = @"branch_id";
NSString *const kDataListTitle = @"title";
NSString *const kDataListFileName = @"file_name";
NSString *const kDataListFileUrl = @"file_url";
NSString *const kDataListFileSize = @"file_size";
NSString *const kDataListWebFileList = @"web_file_list";


@interface DataList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DataList

@synthesize dataListIdentifier = _dataListIdentifier;
@synthesize createDate = _createDate;
@synthesize subType = _subType;
@synthesize webFileSize = _webFileSize;
@synthesize author = _author;
@synthesize publishDate = _publishDate;
@synthesize webFileUrl = _webFileUrl;
@synthesize branchId = _branchId;
@synthesize title = _title;
@synthesize fileName = _fileName;
@synthesize fileUrl = _fileUrl;
@synthesize fileSize = _fileSize;
@synthesize webFileList = _webFileList;


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
            self.dataListIdentifier = [[self objectOrNilForKey:kDataListId fromDictionary:dict] doubleValue];
            self.createDate = [self objectOrNilForKey:kDataListCreateDate fromDictionary:dict];
            self.subType = [self objectOrNilForKey:kDataListSubType fromDictionary:dict];
            self.webFileSize = [self objectOrNilForKey:kDataListWebFileSize fromDictionary:dict];
            self.author = [self objectOrNilForKey:kDataListAuthor fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kDataListPublishDate fromDictionary:dict];
            self.webFileUrl = [self objectOrNilForKey:kDataListWebFileUrl fromDictionary:dict];
            self.branchId = [[self objectOrNilForKey:kDataListBranchId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDataListTitle fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kDataListFileName fromDictionary:dict];
            self.fileUrl = [self objectOrNilForKey:kDataListFileUrl fromDictionary:dict];
            self.fileSize = [self objectOrNilForKey:kDataListFileSize fromDictionary:dict];
    NSObject *receivedWebFileList = [dict objectForKey:kDataListWebFileList];
    NSMutableArray *parsedWebFileList = [NSMutableArray array];
    if ([receivedWebFileList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWebFileList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWebFileList addObject:[WebFileList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWebFileList isKindOfClass:[NSDictionary class]]) {
       [parsedWebFileList addObject:[WebFileList modelObjectWithDictionary:(NSDictionary *)receivedWebFileList]];
    }

    self.webFileList = [NSArray arrayWithArray:parsedWebFileList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataListIdentifier] forKey:kDataListId];
    [mutableDict setValue:self.createDate forKey:kDataListCreateDate];
    [mutableDict setValue:self.subType forKey:kDataListSubType];
    [mutableDict setValue:self.webFileSize forKey:kDataListWebFileSize];
    [mutableDict setValue:self.author forKey:kDataListAuthor];
    [mutableDict setValue:self.publishDate forKey:kDataListPublishDate];
    [mutableDict setValue:self.webFileUrl forKey:kDataListWebFileUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.branchId] forKey:kDataListBranchId];
    [mutableDict setValue:self.title forKey:kDataListTitle];
    [mutableDict setValue:self.fileName forKey:kDataListFileName];
    [mutableDict setValue:self.fileUrl forKey:kDataListFileUrl];
    [mutableDict setValue:self.fileSize forKey:kDataListFileSize];
    NSMutableArray *tempArrayForWebFileList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.webFileList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWebFileList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWebFileList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWebFileList] forKey:kDataListWebFileList];

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

    self.dataListIdentifier = [aDecoder decodeDoubleForKey:kDataListId];
    self.createDate = [aDecoder decodeObjectForKey:kDataListCreateDate];
    self.subType = [aDecoder decodeObjectForKey:kDataListSubType];
    self.webFileSize = [aDecoder decodeObjectForKey:kDataListWebFileSize];
    self.author = [aDecoder decodeObjectForKey:kDataListAuthor];
    self.publishDate = [aDecoder decodeObjectForKey:kDataListPublishDate];
    self.webFileUrl = [aDecoder decodeObjectForKey:kDataListWebFileUrl];
    self.branchId = [aDecoder decodeDoubleForKey:kDataListBranchId];
    self.title = [aDecoder decodeObjectForKey:kDataListTitle];
    self.fileName = [aDecoder decodeObjectForKey:kDataListFileName];
    self.fileUrl = [aDecoder decodeObjectForKey:kDataListFileUrl];
    self.fileSize = [aDecoder decodeObjectForKey:kDataListFileSize];
    self.webFileList = [aDecoder decodeObjectForKey:kDataListWebFileList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataListIdentifier forKey:kDataListId];
    [aCoder encodeObject:_createDate forKey:kDataListCreateDate];
    [aCoder encodeObject:_subType forKey:kDataListSubType];
    [aCoder encodeObject:_webFileSize forKey:kDataListWebFileSize];
    [aCoder encodeObject:_author forKey:kDataListAuthor];
    [aCoder encodeObject:_publishDate forKey:kDataListPublishDate];
    [aCoder encodeObject:_webFileUrl forKey:kDataListWebFileUrl];
    [aCoder encodeDouble:_branchId forKey:kDataListBranchId];
    [aCoder encodeObject:_title forKey:kDataListTitle];
    [aCoder encodeObject:_fileName forKey:kDataListFileName];
    [aCoder encodeObject:_fileUrl forKey:kDataListFileUrl];
    [aCoder encodeObject:_fileSize forKey:kDataListFileSize];
    [aCoder encodeObject:_webFileList forKey:kDataListWebFileList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DataList *copy = [[DataList alloc] init];
    
    if (copy) {

        copy.dataListIdentifier = self.dataListIdentifier;
        copy.createDate = [self.createDate copyWithZone:zone];
        copy.subType = [self.subType copyWithZone:zone];
        copy.webFileSize = [self.webFileSize copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.webFileUrl = [self.webFileUrl copyWithZone:zone];
        copy.branchId = self.branchId;
        copy.title = [self.title copyWithZone:zone];
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.fileUrl = [self.fileUrl copyWithZone:zone];
        copy.fileSize = [self.fileSize copyWithZone:zone];
        copy.webFileList = [self.webFileList copyWithZone:zone];
    }
    
    return copy;
}


@end

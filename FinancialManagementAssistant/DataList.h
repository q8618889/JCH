//
//  DataList.h
//
//  Created by   on 15/4/1
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dataListIdentifier;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *subType;
@property (nonatomic, strong) NSString *webFileSize;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSString *webFileUrl;
@property (nonatomic, assign) double branchId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *fileUrl;
@property (nonatomic, strong) NSString *fileSize;
@property (nonatomic, strong) NSArray *webFileList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

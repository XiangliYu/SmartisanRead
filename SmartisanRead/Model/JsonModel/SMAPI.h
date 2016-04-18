//
//  SMAPI.h
//  AFNDemo
//
//  Created by Oran Wu on 16/4/9.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^HomeIndexAPIBlock)(NSMutableArray *homeSource,NSMutableArray *indexId);
typedef void (^IndexAPIBlock)(NSMutableArray *homeSource);
typedef void (^orderAPIBlock)(NSMutableArray *headerSource,NSMutableArray *cellSource,NSMutableArray *typeSource);

@interface SMAPI : NSObject

+ (void)offset:(int)offset indexDataSource:(HomeIndexAPIBlock)block;
+ (void)orderDataSource:(orderAPIBlock)block;
+ (void)page_id:(int)_id offset:(int)offset cellPageDataSource:(IndexAPIBlock)block;
+ (void)site_id:(int)_id topCellDataSource:(IndexAPIBlock)block;
+ (void)type_id:(int)_id offset:(int)offset typeDataSource:(IndexAPIBlock)block;
+ (void)recommend_id:(int)_id offset:(int)offset recommendDataSource:(IndexAPIBlock)block;

@end

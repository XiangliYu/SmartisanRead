//
//  HistorySQL.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/15.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistorySQL : NSObject

+ (void)creatArticleTable;
+ (void)insertArticleModel:(IndexModel*)model;
+ (void)deleteArticleModel:(IndexModel*)model;
+ (void)selectArticleModel:(IndexModel*)model;
//+ (void)updateArticleModel:(HomeModel*)model;

+ (BOOL)existHistoryModel:(IndexModel*)model;
+ (NSMutableArray *)HistoryList;

@end

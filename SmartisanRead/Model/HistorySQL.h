//
//  HistorySQL.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/15.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
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

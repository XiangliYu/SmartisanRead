//
//  ArticleSQL.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/7.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexModel.h"

@interface ArticleSQL : NSObject

+ (void)creatArticleTable;
+ (void)insertArticleModel:(IndexModel*)model;
+ (void)deleteArticleModel:(IndexModel*)model;
+ (void)selectArticleModel:(IndexModel*)model;
//+ (void)updateArticleModel:(HomeModel*)model;

+ (BOOL)existArticleModel:(IndexModel*)model;
+ (NSMutableArray *)ArticleList;

@end

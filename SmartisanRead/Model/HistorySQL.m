//
//  HistorySQL.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/15.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "HistorySQL.h"

#define dbName @"HistoryDateBase"
#define tbName @"HistoryTable"

@implementation HistorySQL

+ (void)creatArticleTable{
    
    SqlightAdapter *sqlight = [SqlightAdapter database:dbName AndTable:tbName];
    if (sqlight==nil) {
        
        sqlight = [SqlightAdapter database:dbName];
        [sqlight createTable:tbName Info:[NSMutableArray arrayWithObjects:
                                          @"title",
                                          @"headIcon",
                                          @"name",
                                          @"article",
                                          @"date",nil]];
        
        sqlight.tableName = tbName;
    }
}

+ (void)insertArticleModel:(IndexModel *)model{
    
    if ([self existHistoryModel:model]==TRUE) {
        return;
    }else{
        NSString *titleStr = model.title;
        NSString *headStr = model.headIcon;
        NSString *nameStr = model.name;
        NSString *articleUrl = model.article;
        NSDate *dateStr = model.date;
        
        SqlightAdapter *addSql = [SqlightAdapter database:dbName AndTable:tbName];
        SqlightResult *result = [addSql insertData:@{
                                                     @"title":titleStr,
                                                     @"headIcon":headStr,
                                                     @"name":nameStr,
                                                     @"article":articleUrl,
                                                     @"date":dateStr,
                                                     }];
    }
}

+ (void)deleteArticleModel:(IndexModel *)model{
    
    if ([self existHistoryModel:model]) {
        
        SqlightAdapter *deleteSql = [SqlightAdapter database:dbName AndTable:tbName];
        SqlightResult *result = [deleteSql deleteByCondition:@"" Bind:nil];
        
    }
}

+ (void)selectArticleModel:(IndexModel *)model{
    
    SqlightAdapter *selectSql = [SqlightAdapter database:dbName AndTable:tbName];
    SqlightResult *result = [selectSql selectFields:@[@"title", @"headIcon", @"name", @"article", @"date"]
                                        ByCondition:@""
                                               Bind:nil];
}

+ (NSMutableArray*)HistoryList{
    
    SqlightAdapter *selectSql = [SqlightAdapter database:dbName AndTable:tbName];
    SqlightResult *result = [selectSql selectFields:@[@"title", @"headIcon", @"name", @"article", @"date"]
                                        ByCondition:@""
                                               Bind:nil];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (NSArray *array in result.data) {
        
        IndexModel *model = [[IndexModel alloc] init];
        model.title = [array objectAtIndex:0];
        model.headIcon = [array objectAtIndex:1];
        model.name = [array objectAtIndex:2];
        model.article = [array objectAtIndex:3];
        model.date = [array objectAtIndex:4];
        
        [dataArray addObject:model];
    }
    return dataArray;
}

+ (BOOL)existHistoryModel:(IndexModel *)model{
    
    BOOL exist = FALSE;
    
    NSMutableArray *newArray = [self HistoryList];
    
    for (int i=0; i < newArray.count; i++) {
        IndexModel *newModel = [newArray objectAtIndex:i];
        if ([newModel.name isEqualToString:model.name]){
            exist = TRUE;
            break;
        }
    }
    return exist;
}

@end

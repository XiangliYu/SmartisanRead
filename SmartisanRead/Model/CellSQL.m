//
//  SQLiteExc.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/6.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "CellSQL.h"

#define DbName @"CellDb"
#define TbName @"CellTb"

@implementation CellSQL

+ (void)creatTable{

    SqlightAdapter *sqlight = [SqlightAdapter database:DbName AndTable:TbName];
    if (sqlight==nil) {
        
        sqlight = [SqlightAdapter database:DbName];
        [sqlight createTable:TbName Info:[NSMutableArray arrayWithObjects:
                                          @"headIcon",
                                          @"name",
                                          @"title",
                                          @"smallBt",
                                          @"state BOOL",nil]];
        
        sqlight.tableName = TbName;
    }
}

+ (void)insertOrderModel:(CellModel *)model{
    
    if ([self existOrderModel:model]==TRUE) {
        return;
    }else{
        NSString *headStr = model.headIcon;
        NSString *nameStr = model.name;
        NSString *titleStr = model.title;
        NSString *smallBtStr = model.smallBt;
        BOOL states = model.state;
        
        SqlightAdapter *addSql = [SqlightAdapter database:DbName AndTable:TbName];
        SqlightResult *result = [addSql insertData:@{
                                                     @"headIcon":headStr,
                                                     @"name":nameStr,
                                                     @"title":titleStr,
                                                     @"smallBt":smallBtStr,
                                                     @"state":[NSNumber numberWithBool:states],
                                                     }];
        NSLog(@"addResult:%ld",result.code);
    }
}

+ (void)deleteOrderModel:(CellModel *)model{

    if ([self existOrderModel:model]) {
        
        SqlightAdapter *deleteSql = [SqlightAdapter database:DbName AndTable:TbName];
        SqlightResult *result = [deleteSql deleteByCondition:@"" Bind:nil];
        
        NSLog(@"deleteResult:%@",result);
    }
}

+ (void)selectOrderModel:(CellModel *)model{

    SqlightAdapter *selectSql = [SqlightAdapter database:DbName AndTable:TbName];
    SqlightResult *result = [selectSql selectFields:@[@"headIcon", @"name", @"title", @"smallBt", @"state"]
                                        ByCondition:@""
                                               Bind:nil];
    
    NSLog(@"selectResult:%@",result.data);
}



+ (NSMutableArray*)orderList{
    
    SqlightAdapter *selectSql = [SqlightAdapter database:DbName AndTable:TbName];
    SqlightResult *result = [selectSql selectFields:@[@"headIcon", @"name", @"title", @"smallBt", @"state"]
                                        ByCondition:@""
                                               Bind:nil];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (NSArray *array in result.data) {
        
        CellModel *model = [[CellModel alloc] init];
        model.headIcon = [array objectAtIndex:0];
        model.name = [array objectAtIndex:1];
        model.title = [array objectAtIndex:2];
        model.smallBt = [array objectAtIndex:3];
        model.state = [array objectAtIndex:4];
        
        [dataArray addObject:model];
    }
    return dataArray;
}

+ (BOOL)existOrderModel:(CellModel *)model{

    BOOL exist = FALSE;
    
    NSMutableArray *newArray = [self orderList];
    
    for (int i=0; i < newArray.count; i++) {
        CellModel *newModel = [newArray objectAtIndex:i];
        if ([newModel.name isEqualToString:model.name]){
            exist = TRUE;
            break;
        }
    }
    return exist;
}



@end

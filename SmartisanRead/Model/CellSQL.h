//
//  SQLiteExc.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/6.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"

@interface CellSQL : NSObject

+ (void)creatTable;
+ (void)insertOrderModel:(CellModel*)model;
+ (void)deleteOrderModel:(CellModel*)model;
+ (void)selectOrderModel:(CellModel*)model;
//+ (void)updateOrderModel:(CellModel*)model;

+ (BOOL)existOrderModel:(CellModel*)model;
+ (NSMutableArray *)orderList;

@end

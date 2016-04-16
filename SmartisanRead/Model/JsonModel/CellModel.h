//
//  CellModel.h
//  AFNDemo
//
//  Created by Oran Wu on 16/4/11.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *smallBt;
@property(nonatomic,strong)NSString *typeIcon;
@property(nonatomic,strong)NSDate *date;
@property(nonatomic)BOOL state;

- (id)initWithCellDic:(NSDictionary *)dict;

@end

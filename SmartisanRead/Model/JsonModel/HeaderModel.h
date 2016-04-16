//
//  HeaderModel.h
//  AFNDemo
//
//  Created by Xiangli Yu on 16/4/11.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderModel : NSObject

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *pic;
@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *smallBt;
@property(nonatomic,strong)NSString *typeIcon;
@property(nonatomic,strong)NSDate *date;
@property(nonatomic)BOOL state;

- (id)initWithHeaderDic:(NSDictionary *)dict;

@end

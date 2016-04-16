//
//  TypeModel.h
//  AFNDemo
//
//  Created by Xiangli Yu on 16/4/11.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeModel: NSObject

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;

- (id)initWithTypeDic:(NSDictionary *)dict;

@end

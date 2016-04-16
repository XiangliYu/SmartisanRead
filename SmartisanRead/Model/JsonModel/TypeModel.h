//
//  TypeModel.h
//  AFNDemo
//
//  Created by Oran Wu on 16/4/11.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeModel: NSObject

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;

- (id)initWithTypeDic:(NSDictionary *)dict;

@end

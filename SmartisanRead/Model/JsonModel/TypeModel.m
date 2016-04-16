//
//  TypeModel.m
//  AFNDemo
//
//  Created by Xiangli Yu on 16/4/11.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "TypeModel.h"

@implementation TypeModel

- (id)initWithTypeDic:(NSDictionary *)dict{

    NSString *icon = [dict objectForKey:@"icon"];
    NSLog(@"icon:%@",icon);
    
    NSString *cate_id = [dict objectForKey:@"id"];
    NSLog(@"cate_id:%@",cate_id);
    
    NSString *name = [dict objectForKey:@"name"];
    NSLog(@"name:%@",name);
    
    NSString *update_time = [dict objectForKey:@"update_time"];
    NSLog(@"update_time:%@",update_time);
    
    self._id = cate_id;
    self.headIcon = icon;
    self.name = name;
    
    return self;
}

@end

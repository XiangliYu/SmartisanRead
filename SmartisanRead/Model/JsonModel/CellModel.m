//
//  CellModel.m
//  AFNDemo
//
//  Created by Xiangli Yu on 16/4/11.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

- (id)initWithCellDic:(NSDictionary *)dict{

    NSString *admin_uid = [dict objectForKey:@"admin_uid"];
    NSLog(@"admin_uid:%@",admin_uid);
    
    NSString *brief = [dict objectForKey:@"brief"];
    NSLog(@"brief:%@",brief);
    
    NSMutableArray *cate_infoArray = [dict objectForKey:@"cate_info"];
    
    NSString *name = [dict objectForKey:@"name"];
    NSLog(@"name:%@",name);
    
    NSString *pic = [dict objectForKey:@"pic"];
    NSLog(@"pic:%@",pic);
    
    NSString *update_time = [dict objectForKey:@"update_time"];
    NSLog(@"update_time:%@",update_time);
    
    NSString *site_id = [dict objectForKey:@"id"];
    NSLog(@"site_id:%@",site_id);
    
    self._id = site_id;
    self.headIcon = pic;
    
    for (int i=0; i<cate_infoArray.count; i++) {
        
        NSDictionary *cate_infoDic = [cate_infoArray objectAtIndex:i];
        NSLog(@"cate_infoDic:%@",cate_infoDic);
        
        NSString *cate_name = [cate_infoDic objectForKey:@"name"];
        NSLog(@"cate_name:%@",cate_name);
        
        NSString *cate_icon = [cate_infoDic objectForKey:@"icon"];
        NSLog(@"cate_icon:%@",cate_icon);

        self.smallBt = cate_name;
        self.typeIcon = cate_icon;
    }
    self.title = brief;
    self.name = name;
    self.state = NO;
    
    NSTimeInterval time=[update_time doubleValue]+28800;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
    self.date = date;
    self.state = NO;
    
    return self;
}


@end

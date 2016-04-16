//
//  SMModel.m
//  AFNDemo
//
//  Created by Oran Wu on 16/4/11.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "IndexModel.h"

@implementation IndexModel
- (id)initWithIndexDic:(NSDictionary *)dict{
    
    NSString *author_id = [dict objectForKey:@"author_id"];
    NSLog(@"author_id:%@",author_id);
    
    NSString *brief = [dict objectForKey:@"brief"];
    NSLog(@"brief:%@",brief);

    NSString *headpic = [dict objectForKey:@"headpic"];
    NSLog(@"headpic:%@",headpic);
    
    NSString *origin_url = [dict objectForKey:@"origin_url"];
    NSLog(@"origin_url:%@",origin_url);
    
    NSString *prepic1 = [dict objectForKey:@"prepic1"];
    NSLog(@"prepic1:%@",prepic1);
    
    NSString *prepic2 = [dict objectForKey:@"prepic2"];
    NSLog(@"prepic2:%@",prepic2);
    
    NSString *prepic3 = [dict objectForKey:@"prepic3"];
    NSLog(@"prepic3:%@",prepic3);
    
    NSString *create_time = [dict objectForKey:@"create_time"];
    NSLog(@"create_time:%@",create_time);
    
    NSString *index_id = [dict objectForKey:@"site_id"];
    NSLog(@"index_id:%@",index_id);
    
    NSDictionary *site_infoDic = [dict objectForKey:@"site_info"];
    NSLog(@"site_infoDic:%@",site_infoDic);
    
    NSString *name = [site_infoDic objectForKey:@"name"];
    NSLog(@"name:%@",name);
    
    NSString *pic = [site_infoDic objectForKey:@"pic"];
    NSLog(@"pic:%@",pic);
    
    NSString *title = [dict objectForKey:@"title"];
    NSLog(@"title:%@",title);
    
    self._id = index_id;
    self.headIcon = pic;
    self.name = name;
    self.title = title;
    self.content = brief;
    
    if (prepic1.length==0) {
        self.images = nil;
    }else{
        self.images = @[prepic1, prepic2, prepic3];
    }
    
    self.article = origin_url;
    self.star = NO;
    
    NSTimeInterval time=[create_time doubleValue]+28800;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
    self.date = date;
    
    return self;
}
@end

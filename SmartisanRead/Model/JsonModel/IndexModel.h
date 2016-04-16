//
//  SMModel.h
//  AFNDemo
//
//  Created by Oran Wu on 16/4/11.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexModel : NSObject

- (id)initWithIndexDic:(NSDictionary *)dict;

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSDate *date;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)NSString *article;
@property(nonatomic)BOOL star;

@end

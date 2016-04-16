//
//  HomeModel.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property(nonatomic,strong)NSString *headIcon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSArray *images;

+ (NSMutableArray*)ModelArray;

@end

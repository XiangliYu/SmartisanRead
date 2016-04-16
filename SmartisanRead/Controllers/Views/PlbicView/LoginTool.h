//
//  LoginTool.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/18.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginTool : NSObject

+ (BOOL)isLoggedIn;
+ (void)setLogin:(BOOL)login;
@end

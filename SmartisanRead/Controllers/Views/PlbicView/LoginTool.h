//
//  LoginTool.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/18.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginTool : NSObject

+ (BOOL)isLoggedIn;
+ (void)setLogin:(BOOL)login;
@end

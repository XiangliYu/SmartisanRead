//
//  LoginTool.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/18.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "LoginTool.h"
#define LoginStatusKey @"LoginStatusKey"

@implementation LoginTool

+ (BOOL)isLoggedIn{
    return [[NSUserDefaults standardUserDefaults] boolForKey:LoginStatusKey];
  
}

+ (void)setLogin:(BOOL)login{
    [[NSUserDefaults standardUserDefaults] setBool:login forKey:LoginStatusKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end

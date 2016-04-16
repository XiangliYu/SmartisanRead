//
//  LoginTool.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/18.
//  Copyright © 2016年 MO. All rights reserved.
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

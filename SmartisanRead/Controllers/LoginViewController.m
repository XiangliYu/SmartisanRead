//
//  LoginViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController (){

    TopBar *topBar;
    LoginView *loginView;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_content_bg"]]];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setTitle:@"登录"];
    [topBar setLeftbtTitle:@"返回"];
    [topBar leftButtonTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    loginView = [[LoginView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:loginView];
    [loginView buttonTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
        [LoginTool setLogin:YES];

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

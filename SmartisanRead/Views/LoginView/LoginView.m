//
//  LoginView.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/19.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "LoginView.h"
#import "ViewAdditions.h"

@interface LoginView()<UITextFieldDelegate>{

    UIImageView *backView;
    UITextField *phoneNumber;
    UITextField *password;
    UIView *cutLine;
    UIImageView *eyes;
    NSMutableArray *headArray;
    NSMutableArray *trailArray;
    UILabel *remind;
    UIButton *loginButton;
    
    ButtonTappedBlock buttonTapped;
}

@end

@implementation LoginView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self textFieldView];
        [self buttonView];
    }
    return self;
    
}

- (void)textFieldView{

    backView = [[UIImageView alloc] initWithFrame:(CGRect){10,10,self.width-20,93}];
    UIImage *backImage = [UIImage imageNamed:@"login_edittext_single_bg"];
    backView.image = [backImage stretchableImageWithLeftCapWidth:15 topCapHeight:20];
    backView.userInteractionEnabled = YES;
    [self addSubview:backView];
    
    phoneNumber = [[UITextField alloc] initWithFrame:(CGRect){13,3,self.width-30,46}];
    phoneNumber.placeholder = @"手机号码／邮箱";
    phoneNumber.delegate = self;
    [backView addSubview:phoneNumber];
    
    password = [[UITextField alloc] initWithFrame:(CGRect){13,48,self.width-30,46}];
    password.placeholder = @"密码";
    password.delegate = self;
    password.secureTextEntry = NO;
    [backView addSubview:password];
    
    cutLine = [[UIView alloc] initWithFrame:(CGRect){3,46,self.width-25,1}];
    cutLine.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [backView addSubview:cutLine];
    
    eyes = [[UIImageView alloc] initWithFrame:(CGRect){308,50,43,35}];
    
    headArray = (NSMutableArray*)@[[UIImage imageNamed:@"eye_icon_0001"], [UIImage imageNamed:@"eye_icon_0002"], [UIImage imageNamed:@"eye_icon_0003"], [UIImage imageNamed:@"eye_icon_0004"], [UIImage imageNamed:@"eye_icon_0005"], [UIImage imageNamed:@"eye_icon_0006"], [UIImage imageNamed:@"eye_icon_0007"], [UIImage imageNamed:@"eye_icon_0008"], [UIImage imageNamed:@"eye_icon_0009"], [UIImage imageNamed:@"eye_icon_0010"], [UIImage imageNamed:@"eye_icon_0011"], [UIImage imageNamed:@"eye_icon_0012"], [UIImage imageNamed:@"eye_icon_0013"], [UIImage imageNamed:@"eye_icon_0014"], [UIImage imageNamed:@"eye_icon_0015"], [UIImage imageNamed:@"eye_icon_0016"]];

    trailArray = (NSMutableArray*)@[[UIImage imageNamed:@"eye_icon_0016"], [UIImage imageNamed:@"eye_icon_0015"], [UIImage imageNamed:@"eye_icon_0014"], [UIImage imageNamed:@"eye_icon_0013"], [UIImage imageNamed:@"eye_icon_0012"], [UIImage imageNamed:@"eye_icon_0011"], [UIImage imageNamed:@"eye_icon_0010"], [UIImage imageNamed:@"eye_icon_0009"], [UIImage imageNamed:@"eye_icon_0008"], [UIImage imageNamed:@"eye_icon_0007"], [UIImage imageNamed:@"eye_icon_0006"], [UIImage imageNamed:@"eye_icon_0005"], [UIImage imageNamed:@"eye_icon_0004"], [UIImage imageNamed:@"eye_icon_0003"], [UIImage imageNamed:@"eye_icon_0002"], [UIImage imageNamed:@"eye_icon_0001"]];

    eyes.image = [headArray firstObject];
    eyes.animationRepeatCount = 1;
    eyes.animationDuration = 1;
    eyes.userInteractionEnabled = YES;
   
    [backView addSubview:eyes];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [eyes addGestureRecognizer:tap];

}

- (void)buttonView{

    remind = [[UILabel alloc] initWithFrame:(CGRect){0,115,self.width,15}];
    remind.text = @"请使用欢乐云账号登录锤子阅读";
    remind.textAlignment = NSTextAlignmentCenter;
    remind.font = [UIFont systemFontOfSize:14.5];
    remind.textColor = [UIColor colorWithWhite:0.45 alpha:1];
    [self addSubview:remind];
    
    loginButton = [[UIButton alloc] initWithFrame:(CGRect){10,137,self.width-20,53}];
    [self addSubview:loginButton];
    UIImage *normalImage = [UIImage imageNamed:@"login_ok_btn_normal_bg"];
    UIImage *selectedImage = [UIImage imageNamed:@"login_ok_btn_down_bg"];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[selectedImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateSelected];
    [loginButton addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    loginButton.alpha = 0.6;
    loginButton.enabled = NO;
    
    UIButton *forgetPw = [[UIButton alloc] initWithFrame:(CGRect){277,212,100,15}];
    [self addSubview:forgetPw];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"忘记密码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.5 alpha:1] range:strRange];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [forgetPw setAttributedTitle:str forState:UIControlStateNormal];
    forgetPw.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *signIn = [[UILabel alloc] initWithFrame:(CGRect){135,547,100,15}];
    [self addSubview:signIn];
    signIn.text = @"注册新账户";
    signIn.textColor = [UIColor colorWithWhite:0.45 alpha:1];
    signIn.font = [UIFont systemFontOfSize:14];
    
    UIImageView *signImageView = [[UIImageView alloc] initWithFrame:(CGRect){75,0,16,16}];
    signImageView.image = [UIImage imageNamed:@"login_register_arrow"];
    [signIn addSubview:signImageView];
    
    UITapGestureRecognizer *signTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(signInAction:)];
    [signIn addGestureRecognizer:signTap];
}

- (void)tapAction:(UITapGestureRecognizer*)tap{
    
    if (password.secureTextEntry==YES) {
        eyes.animationImages = trailArray;
        eyes.image = [eyes.animationImages lastObject];
        password.secureTextEntry=NO;
        [eyes startAnimating];
    }else{
        eyes.animationImages = headArray;
        eyes.image = [eyes.animationImages lastObject];
        password.secureTextEntry=YES;
        [eyes startAnimating];
    }
    
}

- (void)returnAction{

    if (buttonTapped)
        buttonTapped();
    
}

- (void)buttonTapped:(ButtonTappedBlock)block{

    buttonTapped = [block copy];

}

- (void)signInAction:(UITapGestureRecognizer*)sigIn{

}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
        loginButton.alpha = 1;
        loginButton.enabled = YES;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

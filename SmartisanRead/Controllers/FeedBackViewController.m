//
//  FeedBackViewController.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/23.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()<UITextViewDelegate,UITextFieldDelegate>{

    TopBar *topBar;
    UITextView *textView;
    UILabel *placeholder;
    UITextField *mailField;
    UIButton *pictureBt;
    UIButton *loginButton;
}

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_content_bg"]]];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:@"问题反馈"];
    [topBar returnBtTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [self textView];
    [self mailView];
    [self pictureView];
}

- (void)textView{

    UIImageView *textBackground = [[UIImageView alloc] initWithFrame:(CGRect){10,90,self.view.width-20,180}];
    [self.view addSubview:textBackground];
    textBackground.userInteractionEnabled = YES;
    UIImage *background = [UIImage imageNamed:@"login_edittext_single_bg"];
    textBackground.image = [background stretchableImageWithLeftCapWidth:15 topCapHeight:20];
    
    textView = [[UITextView alloc] initWithFrame:(CGRect){10,10,self.view.width-40,160}];
    [textBackground addSubview:textView];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:15];
    
    placeholder =[[UILabel alloc] initWithFrame:(CGRect){6,10,300,15}];
    [textView addSubview:placeholder];
    placeholder.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    placeholder.text = @"请详细描述您遇到的问题（不超过1000字）";
    placeholder.font = [UIFont systemFontOfSize:15];
}

- (void)mailView{

    UIImageView *mailBackground = [[UIImageView alloc] initWithFrame:(CGRect){10,280,self.view.width-20,52}];
    [self.view addSubview:mailBackground];
    mailBackground.userInteractionEnabled = YES;
    UIImage *background = [UIImage imageNamed:@"login_edittext_single_bg"];
    mailBackground.image = [background stretchableImageWithLeftCapWidth:15 topCapHeight:20];

    mailField = [[UITextField alloc] initWithFrame:(CGRect){15,20,335,15}];
    [mailBackground addSubview:mailField];
    mailField.placeholder = @"电子邮箱（选填）";
    mailField.font = [UIFont systemFontOfSize:15];
}

- (void)pictureView{

    UIImageView *pictureGround = [[UIImageView alloc] initWithFrame:(CGRect){10,345,self.view.width-20,80}];
    [self.view addSubview:pictureGround];
    pictureGround.userInteractionEnabled = YES;
    UIImage *background = [UIImage imageNamed:@"login_edittext_single_bg"];
    pictureGround.image = [background stretchableImageWithLeftCapWidth:15 topCapHeight:20];
    
    pictureBt = [[UIButton alloc] initWithFrame:(CGRect){15,12.5,55,55}];
    [pictureGround addSubview:pictureBt];
    [pictureBt setBackgroundImage:[UIImage imageNamed:@"feedback_normal"] forState:UIControlStateNormal];
    [pictureBt setBackgroundImage:[UIImage imageNamed:@"feedback_selected"] forState:UIControlStateSelected];
    [pictureBt addTarget:self action:@selector(pictureAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){80,32,100,15}];
    [pictureGround addSubview:label];
    label.text = @"反馈附图";
    label.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    label.font = [UIFont systemFontOfSize:15];
    
    loginButton = [[UIButton alloc] initWithFrame:(CGRect){10,440,self.view.width-20,53}];
    [self.view addSubview:loginButton];
    UIImage *normalImage = [UIImage imageNamed:@"login_ok_btn_normal_bg"];
    UIImage *selectedImage = [UIImage imageNamed:@"login_ok_btn_down_bg"];
    [loginButton setTitle:@"提交" forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[selectedImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateSelected];
    [loginButton addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    loginButton.alpha = 0.6;
    loginButton.enabled = NO;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)TextView{

    return YES;
}

- (void)textViewDidChange:(UITextView *)TextView{
    
    if (TextView.text.length==0) {
        
        [placeholder setHidden:NO];

    }else{
        [placeholder setHidden:YES];
        loginButton.enabled = YES;
        loginButton.alpha = 1;
    }
}

- (void)pictureAction{


}

- (void)loginOut{

    [self dismissViewControllerAnimated:YES completion:nil];
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

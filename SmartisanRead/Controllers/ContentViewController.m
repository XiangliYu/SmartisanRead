//
//  ContentViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/31.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "ContentViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface ContentViewController ()<UIScrollViewDelegate,UIWebViewDelegate>{

    TopBar *topBar;
    UIButton *starButton;
    UIButton *transmitBt;
    UIScrollView *scrollView;
    UIImageView *headIcon;
    UILabel *name;
    UILabel *time;
    UILabel *title;
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [HistorySQL creatArticleTable];
    [HistorySQL insertArticleModel:self.model];
        
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"fav:%@",self.model.name);
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:nil];
    [topBar returnBtTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    starButton = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-105,2,50,50}];
    [topBar addSubview:starButton];
    [starButton setBackgroundImage:[UIImage imageNamed:@"details_favourite_btn_pressed"] forState:UIControlStateNormal];
    [starButton addTarget:self action:@selector(starBtAction) forControlEvents:UIControlEventTouchUpInside];

    transmitBt = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-50,6.5,51,42}];
    [topBar addSubview:transmitBt];
    [transmitBt setImage:[UIImage imageNamed:@"share_btn_normal"] forState:UIControlStateNormal];
    [transmitBt setImage:[UIImage imageNamed:@"share_btn_pressed"] forState:UIControlStateSelected];
    [transmitBt addTarget:self action:@selector(transmitBtAction) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.contentSize = (CGSize){self.view.width,2400};
    
    headIcon = [[UIImageView alloc] initWithFrame:(CGRect){18,20,22,22}];
    [headIcon setImageWithURL:[NSURL URLWithString:self.model.headIcon] placeholderImage:[UIImage imageNamed:@"3dddbd32ae80eb5e9e16fc83dabcc102"]];
    headIcon.layer.cornerRadius = 11;
    headIcon.layer.masksToBounds = YES;
    [scrollView addSubview:headIcon];
    
    name = [[UILabel alloc] initWithFrame:(CGRect){56,24,100,15}];
    [scrollView addSubview:name];
    name.text = self.model.name;
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    
    time = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-120,25,100,15}];
    [scrollView addSubview:time];
    
    NSTimeInterval timeInterval=[self.model.date doubleValue]+28800;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    time.text = [dateFormatter stringFromDate:date];
    time.font = [UIFont systemFontOfSize:13];
    time.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    
    webView = [[UIWebView alloc] initWithFrame:(CGRect){0,42,self.view.width,self.view.height-42}];
    [scrollView addSubview:webView];
    webView.delegate = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.model.article]];
    [webView loadRequest:request];
    
    [ArticleSQL creatArticleTable];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{

    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:(CGRect){0,0,30,30}];
    [scrollView addSubview:activityIndicator];
    activityIndicator.center = self.view.center;
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [activityIndicator stopAnimating];
    
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"error loading operatung system" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"return", nil];
    [alterview show];
}

- (void)starBtAction{

    if (self.model.star==NO) {
        
        [starButton setBackgroundImage:[UIImage imageNamed:@"details_favourite_btn_pressed"] forState:UIControlStateNormal];
        self.model.star=YES;
        
    }else if(self.model.star==YES){
    
        [starButton setBackgroundImage:[UIImage imageNamed:@"details_favourite_btn_checked"] forState:UIControlStateNormal];
        self.model.star=NO;
    }
    
    if (self.model.star==NO) {
        
        [ArticleSQL insertArticleModel:self.model];
    }
}

- (void)transmitBtAction{
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

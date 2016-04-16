//
//  SetUpViewController.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/18.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "SetUpViewController.h"

@interface SetUpViewController ()<UIScrollViewDelegate>{

    UIImageView *background;
    TopBar *topBar;
    UIScrollView *scrollView;
    UIView *contentView;
    PersonView *personView;
    UIButton *returnBt;
    UIButton *loginButton;
}

@end

@implementation SetUpViewController

- (void)viewWillAppear:(BOOL)animated{

    if ([LoginTool isLoggedIn]){
        [self loginView];
        
    }else{
        [self notLoginView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    CGRect frame = self.view.frame;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_content_bg"]]];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setTitle:@"设置"];
    [topBar setLeftbtTitle:@"返回"];
    [topBar leftButtonTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
  
    personView = [[PersonView alloc] initWithFrame:frame];
    [scrollView addSubview:personView];
    
    NSInteger ListCount = [CellSQL orderList].count;
    if (ListCount>0) {
        NSString *listNum = [NSString stringWithFormat:@"%ld个站点",ListCount];
        [personView setListNum:listNum];
        NSLog(@"listStr:%@",listNum);
    }

    [personView ListBtTapped:^{
        
        ListViewController *ListVC = [[ListViewController alloc] init];
        [self.navigationController pushViewController:ListVC animated:YES];
    }];
    
    NSInteger FavCount = [ArticleSQL ArticleList].count;
    if (FavCount>0) {
        NSString *favNum = [NSString stringWithFormat:@"%ld篇文章",FavCount];
        [personView setFavNum:favNum];
        NSLog(@"listStr:%@",favNum);
    }

    [personView FavoriteBtTapped:^{
        
        FavoriteViewController *FavoriteVC = [[FavoriteViewController alloc] init];
        [self.navigationController pushViewController:FavoriteVC animated:YES];
    }];
    [personView HistoryBtTapped:^{
        
        HistoryViewController *HistoryVC = [[HistoryViewController alloc] init];
        [self.navigationController pushViewController:HistoryVC animated:YES];
    }];
    
    returnBt = [[UIButton alloc] init];
    [scrollView addSubview:returnBt];
    UIImage *normalImage = [UIImage imageNamed:@"usercenter_logout_btn_normal"];
    UIImage *selectedImage = [UIImage imageNamed:@"usercenter_logout_btn_down"];
    [returnBt setTitle:@"退出登录" forState:UIControlStateNormal];
    [returnBt setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateNormal];
    [returnBt setBackgroundImage:[selectedImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateSelected];
    returnBt.titleLabel.font = [UIFont systemFontOfSize:18];

    contentView = [[UIView alloc] initWithFrame:frame];
    [scrollView addSubview:contentView];
    
    SetCell *shareCell = [[SetCell alloc] initWithFrame:(CGRect){0,0,self.view.width,62} Type:1 Title:@"分享此应用给朋友" Content:nil Button:nil];
    [shareCell cellButtonTapped:^{
        
        SelectedView *selected = [[SelectedView alloc] initWithFrame:(CGRect){0,0,self.view.width,self.view.height}];
        [selected setSelectedTitle:@"请选择操作" ImageIcon:nil Name:nil];
        [self.view addSubview:selected];
        
    }];
    [contentView addSubview:shareCell];
    
    SetCell *updateCell = [[SetCell alloc] initWithFrame:(CGRect){0,62,self.view.width,62} Type:2 Title:@"检查更新" Content:@"v1.0.1 beta" Button:nil];
    [updateCell cellButtonTapped:^{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"检查更新" message:@"检测到新版的锤子阅读（v1.0.2beta版），是否下载新版本？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消更新" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"下载更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            [self presentViewController:loginVC animated:YES completion:nil];
            
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        [self presentViewController:alertController animated:YES completion:nil];

        
    }];
    [contentView addSubview:updateCell];
    
    SetCell *memoryCell = [[SetCell alloc] initWithFrame:(CGRect){0,124,self.view.width,62} Type:2 Title:@"清除缓存" Content:@"1.2M" Button:nil];
    [memoryCell cellButtonTapped:^{
        
    }];
    [contentView addSubview:memoryCell];
    
    SetCell *feedbackCell = [[SetCell alloc] initWithFrame:(CGRect){0,186,self.view.width,62} Type:2 Title:@"问题反馈" Content:nil Button:@"usercenter_arrow_normal"];
    [feedbackCell cellButtonTapped:^{
        
        FeedBackViewController *FeedBackVC = [[FeedBackViewController alloc] init];
        [self presentViewController:FeedBackVC animated:YES completion:nil];
        
    }];
    [contentView addSubview:feedbackCell];
    
    SetCell *experienceCell = [[SetCell alloc] initWithFrame:(CGRect){0,248,self.view.width,62} Type:3 Title:@"用户体验改进计划" Content:nil Button:@"usercenter_arrow_normal"];
    [experienceCell cellButtonTapped:^{
        
        UEViewController *UEVC = [[UEViewController alloc] init];
        [self.navigationController pushViewController:UEVC animated:YES];
        
    }];
    [contentView addSubview:experienceCell];
    
    UILabel *sectionTitle = [[UILabel alloc] initWithFrame:(CGRect){20,321,self.view.width,15}];
    [contentView addSubview:sectionTitle];
    sectionTitle.text = @"关于我们";
    sectionTitle.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    sectionTitle.font = [UIFont systemFontOfSize:15];
    
    SetCell *wechatCell = [[SetCell alloc] initWithFrame:(CGRect){0,341,self.view.width,62} Type:1 Title:@"微信公众号" Content:@"smartisan2012" Button:nil];
    [wechatCell cellButtonTapped:^{
        
        CopyView *copyView = [[CopyView alloc] initWithFrame:(CGRect){0,0,self.view.width,self.view.height}];
        [copyView setCopyTitle:@"复制后打开微信，在查找公众号处可粘贴搜索并关注"];
        [self.view addSubview:copyView];
        
    }];
    [contentView addSubview:wechatCell];
    
    SetCell *weboCell = [[SetCell alloc] initWithFrame:(CGRect){0,403,self.view.width,62} Type:2 Title:@"新浪微博" Content:@"@锤子科技" Button:nil];
    [weboCell cellButtonTapped:^{
        
        CopyView *copyView = [[CopyView alloc] initWithFrame:(CGRect){0,0,self.view.width,self.view.height}];
        [copyView setCopyTitle:@"复制后打开微博，在搜索微博处可粘贴搜索并关注"];
        [self.view addSubview:copyView];

    }];
    [contentView addSubview:weboCell];
    
    SetCell *httpCell = [[SetCell alloc] initWithFrame:(CGRect){0,465,self.view.width,62} Type:2 Title:@"官方网站" Content:@"www.smartisan.com" Button:nil];
    [httpCell cellButtonTapped:^{
        
        NSString *str = @"http://store.smartisan.com/";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
         
        
    }];
    [contentView addSubview:httpCell];
    
    SetCell *joinCell = [[SetCell alloc] initWithFrame:(CGRect){0,527,self.view.width,62} Type:3 Title:@"内容合作" Content:@"yuedu@smartisan.com" Button:nil];
    [joinCell cellButtonTapped:^{
       
    }];
    [contentView addSubview:joinCell];
    
    loginButton = [[UIButton alloc] initWithFrame:frame];
    [scrollView addSubview:loginButton];
    UIImage *normalBt = [UIImage imageNamed:@"login_edittext_single_bg"];
    [loginButton setBackgroundImage:[normalBt stretchableImageWithLeftCapWidth:15 topCapHeight:20] forState:UIControlStateNormal];
    [loginButton setTitle:@"登录Smartisan ID" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];

}

- (void)loginView{
    
    scrollView.contentSize = (CGSize){self.view.width,1010};
    [personView setFrame:(CGRect){0,0,self.view.width,346}];
    [contentView setFrame:(CGRect){0,355,self.view.width,590}];
    [returnBt setFrame:(CGRect){10,955,self.view.width-20,55}];
    [returnBt addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [loginButton setFrame:(CGRect){0,1100,0,0}];
}

- (void)notLoginView{
   
    [contentView setFrame:(CGRect){0,80,self.view.width,590}];
    [loginButton setFrame:(CGRect){10,10,self.view.width-20,62}];
    [scrollView setContentSize:(CGSize){self.view.width,680}];
    
    [personView setFrame:(CGRect){0,800,0,0}];
}

- (void)returnAction{
    
    [LoginTool setLogin:NO];
    [self notLoginView];
}

- (void)loginAction{

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
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

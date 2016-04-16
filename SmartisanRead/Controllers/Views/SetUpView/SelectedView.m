//
//  SelectedView.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/23.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "SelectedView.h"

@interface SelectedView ()<UIScrollViewDelegate,UIPageViewControllerDelegate>{

    UIScrollView *scrollView;
    UIPageControl *pageCtrl;
    UIView *background;
    UIView *selectedView;
}

@end

@implementation SelectedView

- (void)setSelectedTitle:(NSString *)title ImageIcon:(NSString *)image Name:(NSString *)name{

    background = [[UIView alloc] initWithFrame:(CGRect){0,0,self.width,self.height-290}];
    background.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
    [self addSubview:background];
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTap:)];
    [background addGestureRecognizer:backTap];
    
    selectedView = [[UIView alloc] initWithFrame:(CGRect){0,self.height-290,self.width,290}];;
    [self addSubview:selectedView];
    selectedView.backgroundColor = [UIColor colorWithWhite:0.898 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){0,0,self.width,53}];
    [selectedView addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16];
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){310,0,68.5,53}];
    [selectedView addSubview:button];
    [button setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"cancel_btn_pressed"] forState:UIControlStateSelected];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleEdgeInsets = (UIEdgeInsets){0,-70,0,0};
    [button addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *cutLine = [[UIView alloc] initWithFrame:(CGRect){0,53,self.width,1}];
    [selectedView addSubview:cutLine];
    cutLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,54,self.width,216}];
    [selectedView addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = (CGSize){self.width*3,216};
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    pageCtrl = [[UIPageControl alloc] initWithFrame:(CGRect){175,270,25,10}];
    [selectedView addSubview:pageCtrl];
    pageCtrl.numberOfPages = 3;
    pageCtrl.currentPageIndicatorTintColor = [UIColor grayColor];
    pageCtrl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    [pageCtrl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *imageArray = (NSMutableArray*)@[@"qq_", @"weixin_", @"webo_", @"xueqiu_", @"youjian_", @"shibie_", @"lanya_", @"send_", @"rili_", @"meiquan_", @"friend_", @"Es_", @"add_", @"AirDroid_", @"bianqian_", @"collect_"];
    NSMutableArray *titleArray = (NSMutableArray*)@[@"发送给好友", @"微信", @"新浪微博", @"雪球聊天", @"邮件", @"分享给朋友", @"蓝牙", @"发送到我的电脑", @"日历", @"加到玩美圈", @"朋友圈", @"发送到ES网络", @"添加到微信收藏", @"AirDroid", @"锤子便签", @"保存到QQ收藏"];
    
    for (int i=0; i<imageArray.count; i++) {
        
        NSString *btImage = [imageArray objectAtIndex:i];
        NSString *btTitle = [titleArray objectAtIndex:i];
        
        float width = self.width/3;
        float height = 40;
        int left = i%9;
        int top = i/9;
        
        UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){40+width*left,30+top*(height+45),45,45}];
        [button setImage:[UIImage imageNamed:btImage] forState:UIControlStateNormal];
        [button setTitle:btTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleEdgeInsets = (UIEdgeInsets){72,-92,0,-50};
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [scrollView addSubview:button];
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)ScrollView{
    
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    pageCtrl.currentPage = page;
}

- (void)pageAction:(UIPageControl*)page{
    
    int pageNum =(int)pageCtrl.currentPage;
    CGSize size = scrollView.frame.size;
    [scrollView setContentOffset:(CGPoint){(pageNum+1)*size.width,0} animated:YES];
}

- (void)cancelAction{

    self.hidden = YES;
}

- (void)backTap:(UITapGestureRecognizer*)back{
    
    self.hidden = YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

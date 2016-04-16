//
//  PersonView.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/19.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "PersonView.h"
#import "ViewAdditions.h"
#import "SetCell.h"

@interface PersonView (){

    SetCell *subscribeView;
    SetCell *collectView;
    SetCell *recordView;

    ButtonTappedBlock headerBlock;
    ButtonTappedBlock cellBlock;
}

@end

@implementation PersonView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self headerView];
        [self contentCell];
    }
    return self;
    
}

- (void)headerView{

    UIImageView *backView = [[UIImageView alloc] initWithFrame:(CGRect){10,10,self.width-20,140}];
    UIImage *backImage = [UIImage imageNamed:@"login_edittext_single_bg"];
    backView.image = [backImage stretchableImageWithLeftCapWidth:17 topCapHeight:30];
    [self addSubview:backView];
    
    UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:(CGRect){153,30,69,69}];
    buttonImage.image = [UIImage imageNamed:@"usercenter_head_default"];
    [self addSubview:buttonImage];
    
    UIButton *headButton = [[UIButton alloc] initWithFrame:(CGRect){143,25,81,81}];
    [self addSubview:headButton];
    [headButton setBackgroundImage:[UIImage imageNamed:@"usercenter_usericon_normal"] forState:UIControlStateNormal];
    [headButton setBackgroundImage:[UIImage imageNamed:@"usercenter_usericon_pressed"] forState:UIControlStateSelected];
    [headButton addTarget:self action:@selector(headAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *userName = [[UILabel alloc] initWithFrame:(CGRect){0,112,self.width,18}];
    [self addSubview:userName];
    userName.text = @"用户名";
    userName.textAlignment = NSTextAlignmentCenter;
    userName.font = [UIFont systemFontOfSize:17];

}

- (void)contentCell{

    subscribeView = [[SetCell alloc] initWithFrame:(CGRect){0,160,self.width,62}];
    [subscribeView setType:1 headImage:@"usercenter_registed_date_normal" Title:@"订阅列表" Content:@"2个站点"];
    [subscribeView cellButtonTapped:^{
        [self cellAction];
    }];
    [self addSubview:subscribeView];
    
    collectView = [[SetCell alloc] initWithFrame:(CGRect){0,222,self.width,62}];
    [collectView setType:2 headImage:@"usercenter_favourite_icon_normal" Title:@"我的收藏" Content:nil];
    [collectView cellButtonTapped:^{
        [self cellAction];
    }];
    [self addSubview:collectView];
    
    recordView = [[SetCell alloc] initWithFrame:(CGRect){0,284,self.width,62}];
    [recordView setType:3 headImage:@"usercenter_online_icon_normal" Title:@"阅读历史" Content:nil];
    [recordView cellButtonTapped:^{
        [self cellAction];
    }];
    [self addSubview:recordView];
    
}

- (void)cellAction{

    if (cellBlock)cellBlock();
}

- (void)headAction{

    if (headerBlock)headerBlock();
}

- (void)HeaderBtTapped:(ButtonTappedBlock)block{

    headerBlock = [block copy];
}

- (void)CellBtTapped:(ButtonTappedBlock)block{

    cellBlock = [block copy];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  PersonView.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "PersonView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface PersonView (){

    SetCell *subscribeView;
    SetCell *collectView;
    SetCell *recordView;

    ButtonTappedBlock headerBlock;
    ButtonTappedBlock listBlock;
    ButtonTappedBlock favoriteBlock;
    ButtonTappedBlock historyBlock;
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
    
    UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:(CGRect){SCREEN_WIDTH-223,30,69,69}];
    buttonImage.image = [UIImage imageNamed:@"usercenter_head_default"];
    [self addSubview:buttonImage];
    
    UIButton *headButton = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-225,25,81,81}];
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
    [subscribeView setType:1 headImage:@"usercenter_registed_date_normal" Title:@"订阅列表"];
    [subscribeView cellButtonTapped:^{
        [self ListBtAction];
    }];
    [self addSubview:subscribeView];
    
    collectView = [[SetCell alloc] initWithFrame:(CGRect){0,222,self.width,62}];
    [collectView setType:2 headImage:@"usercenter_favourite_icon_normal" Title:@"我的收藏"];
    [collectView cellButtonTapped:^{
        [self favoriteBtAction];
    }];
    [self addSubview:collectView];
    
    recordView = [[SetCell alloc] initWithFrame:(CGRect){0,284,self.width,62}];
    [recordView setType:3 headImage:@"usercenter_online_icon_normal" Title:@"阅读历史"];
    [recordView cellButtonTapped:^{
        [self historyBtAction];
    }];
    [self addSubview:recordView];
    
}

- (void)setListNum:(NSString *)listNum{

    UILabel *number = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-98,25,100,15}];
    [subscribeView addSubview:number];
    number.text = listNum;
    number.font = [UIFont systemFontOfSize:15];
    number.textColor = [UIColor colorWithWhite:0.6 alpha:1];
}

- (void)setFavNum:(NSString *)favNum{

    UILabel *number = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-98,25,100,15}];
    [collectView addSubview:number];
    number.text = favNum;
    number.font = [UIFont systemFontOfSize:15];
    number.textColor = [UIColor colorWithWhite:0.6 alpha:1];
}

- (void)headAction{
    
    if (headerBlock)headerBlock();
}

- (void)HeaderBtTapped:(ButtonTappedBlock)block{
    
    headerBlock = [block copy];
}

- (void)ListBtTapped:(ButtonTappedBlock)block{

    listBlock = [block copy];
}

- (void)ListBtAction{

    if (listBlock)listBlock();
}

- (void)FavoriteBtTapped:(ButtonTappedBlock)block{
    
    favoriteBlock = [block copy];
}

- (void)favoriteBtAction{
    
    if (favoriteBlock)favoriteBlock();
}

- (void)HistoryBtTapped:(ButtonTappedBlock)block{
    
    historyBlock = [block copy];
}

- (void)historyBtAction{
    
    if (historyBlock)historyBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

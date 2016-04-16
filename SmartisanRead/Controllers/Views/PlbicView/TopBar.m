//
//  TopBar.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "TopBar.h"

@interface TopBar(){
    
    ButtonTappedBlock leftTapped;
    ButtonTappedBlock rightTapped;
    ButtonTappedBlock returnTapped;
}

@end

@implementation TopBar

- (id)initWithFrame:(CGRect)frame{
    
    self= [super initWithFrame:frame];
    if (self) {
        
        UIImageView *backView = [[UIImageView alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
        [self addSubview:backView];
        backView.image = [UIImage imageNamed:@"product_titlebar_white"];
    }
    return self;
}

- (void)setTitle:(NSString *)title{

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:titleLabel];
}

- (void)setLeftbtTitle:(NSString *)title{

    UIButton *leftButton = [[UIButton alloc] initWithFrame:(CGRect){4,0,68.5,53}];
    [self addSubview:leftButton];

    [leftButton setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"cancel_btn_pressed"] forState:UIControlStateSelected];
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    leftButton.titleEdgeInsets = (UIEdgeInsets){0,-70,0,0};
    [leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setRightbtTitle:(NSString *)title{

    UIButton *rightButton = [[UIButton alloc] initWithFrame:(CGRect){302.5,0,68.5,53}];
    [self addSubview:rightButton];
    [rightButton setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"cancel_btn_pressed"] forState:UIControlStateSelected];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    rightButton.titleEdgeInsets = (UIEdgeInsets){0,-70,0,0};
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setReturnBt:(NSString *)btImage Title:(NSString *)title{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:titleLabel];

    UIButton *returnBt = [[UIButton alloc] initWithFrame:(CGRect){4,2,72,53}];
    [self addSubview:returnBt];
    
    [returnBt setImage:[UIImage imageNamed:@"dialog_title_button_back"] forState:UIControlStateNormal];
    [returnBt setImage:[UIImage imageNamed:@"dialog_title_button_back_pressed"] forState:UIControlStateSelected];
    [returnBt setTitle:btImage forState:UIControlStateNormal];
    [returnBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    returnBt.titleLabel.font = [UIFont systemFontOfSize:15];
    returnBt.titleEdgeInsets = (UIEdgeInsets){0,-60,0,0};
    [returnBt addTarget:self action:@selector(returnButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)leftButtonAction{

    if (leftTapped)leftTapped();
}

- (void)rightButtonAction{

    if (rightTapped)rightTapped();
}

- (void)leftButtonTapped:(ButtonTappedBlock)block{

    leftTapped = [block copy];
}

- (void)rightButtonTapped:(ButtonTappedBlock)block{

    rightTapped = [block copy];
}

- (void)returnButtonAction{

    if (returnTapped) returnTapped();
}

- (void)returnBtTapped:(ButtonTappedBlock)block{

    returnTapped = [block copy];    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

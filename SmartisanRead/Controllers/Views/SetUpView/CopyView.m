//
//  CopyView.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/23.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "CopyView.h"

@interface CopyView (){

    UIView *background;
    UIView *copyView;
    UIButton *copyButton;
}

@end

@implementation CopyView

- (void)setCopyTitle:(NSString *)title{

    background = [[UIView alloc] initWithFrame:(CGRect){0,0,self.width,self.height-140}];
    background.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
    [self addSubview:background];
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTap:)];
    [background addGestureRecognizer:backTap];
    
    copyView = [[UIView alloc] initWithFrame:(CGRect){0,self.height-140,self.width,140}];;
    [self addSubview:copyView];
    copyView.backgroundColor = [UIColor colorWithWhite:0.898 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){80,7,220,40}];
    [copyView addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){310,0,68.5,53}];
    [copyView addSubview:button];
    [button setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"cancel_btn_pressed"] forState:UIControlStateSelected];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleEdgeInsets = (UIEdgeInsets){0,-70,0,0};
    [button addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *cutLine = [[UIView alloc] initWithFrame:(CGRect){0,53,self.width,1}];
    [copyView addSubview:cutLine];
    cutLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];

    copyButton = [[UIButton alloc] initWithFrame:(CGRect){10,70,self.width-20,53}];
    [copyView addSubview:copyButton];
    UIImage *normalImage = [UIImage imageNamed:@"menu_dialog_button_gray_normal"];
    UIImage *selectedImage = [UIImage imageNamed:@"menu_dialog_button_gray_pressed"];
    [copyButton setTitle:@"复制" forState:UIControlStateNormal];
    [copyButton setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateNormal];
    [copyButton setBackgroundImage:[selectedImage stretchableImageWithLeftCapWidth:10 topCapHeight:25] forState:UIControlStateSelected];
    [copyButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    copyButton.titleLabel.font = [UIFont systemFontOfSize:18];
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

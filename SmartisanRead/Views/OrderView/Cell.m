//
//  Cell.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/21.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "Cell.h"
#import "ViewAdditions.h"
#import "LoginTool.h"

@interface Cell (){

    UIImageView *headIcon;
    UILabel *titleLabel;
    UILabel *noteLabel;
    UIButton *smallIcon;
    UIView *bottomLine;
    UIButton *rightBt;
    
    ButtonTappedBlock cellTapped;
    ButtonTappedBlock changeBtImage;
    ButtonTappedBlock alertTapped;
    showTextBlock returnText;
    
    BOOL change;
}

@end

@implementation Cell

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        headIcon = [[UIImageView alloc] initWithFrame:(CGRect){17,10,44,44}];
        [self addSubview:headIcon];
       
        
        titleLabel = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:titleLabel];
        
        
        noteLabel = [[UILabel alloc] initWithFrame:(CGRect){71,38,200,15}];
        [self addSubview:noteLabel];
        
        smallIcon = [[UIButton alloc] initWithFrame:frame];
        [self addSubview:smallIcon];
        
        
        rightBt = [[UIButton alloc] initWithFrame:(CGRect){297,15,64,32}];
        [self addSubview:rightBt];
        
        
        bottomLine = [[UIView alloc] initWithFrame:(CGRect){72,self.height-1.5,290,1.5}];
        [self addSubview:bottomLine];
        bottomLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellAction:)];
        [self addGestureRecognizer:tap];
        
        change=YES;

        
    }
    return self;

}

- (void)setModel:(Model *)model{

    headIcon.image = [UIImage imageNamed:model.headIcon];
    headIcon.layer.cornerRadius = 22;
    headIcon.layer.masksToBounds = YES;
    
    titleLabel.x = 72;
    titleLabel.y = 12;
    titleLabel.text = model.title;
    titleLabel.font = [UIFont systemFontOfSize:18];
    [titleLabel sizeToFit];

    noteLabel.text = model.note;
    noteLabel.font = [UIFont systemFontOfSize:13];
    noteLabel.textColor = [UIColor colorWithWhite:0.55 alpha:1];

    smallIcon.x = titleLabel.right +12;
    [smallIcon setFrame:(CGRect){smallIcon.x,14,33,17}];
    [smallIcon setBackgroundImage:[UIImage imageNamed:@"smallbt"] forState:UIControlStateNormal];
    [smallIcon setTitle:model.smallBt forState:UIControlStateNormal];
    [smallIcon setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
    smallIcon.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [rightBt setBackgroundImage:[UIImage imageNamed:@"orderBt"] forState:UIControlStateNormal];
    [rightBt addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
    [rightBt setTitle:@"订阅" forState:UIControlStateNormal];
    [rightBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [UIFont systemFontOfSize:13];
    
    if (returnText!=nil) {
        returnText(model.title);
    }
}

- (void)setSmallImage:(NSString *)image{
    
    smallIcon.width = 15;
    smallIcon.height = 15;
    [smallIcon setTitle:nil forState:UIControlStateNormal];
    [smallIcon setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];

}

- (void)changeBtImage{
    
    if ([LoginTool isLoggedIn ]) {
        
        if (change==YES) {
            UIImage *btImage = [UIImage imageNamed:@"orderBt"];
            [rightBt setTitle:@"订阅" forState:UIControlStateNormal];
            [rightBt setBackgroundImage:btImage forState:UIControlStateNormal];
            change=NO;
        }else if(change==NO){
            UIImage *btImage = [UIImage imageNamed:@"orderBtSeleced"];
            [rightBt setTitle:nil forState:UIControlStateNormal];
            [rightBt setBackgroundImage:btImage forState:UIControlStateNormal];
            change=YES;
        }
    }else{
        [self alertAction];
    }
}

- (void)cellAction:(UITapGestureRecognizer*)tap{
    
    if (cellTapped) cellTapped();
}

- (void)cellTapped:(ButtonTappedBlock)block{
    
    cellTapped = [block copy];
}

- (void)changeImage{
    
    if (changeBtImage) changeBtImage();
}

- (void)changeBtImage:(ButtonTappedBlock)block{
    
    changeBtImage = [block copy];
}

- (void)alertAction{
    
    if (alertTapped) alertTapped();
}

- (void)alertTapped:(ButtonTappedBlock)block{
    
    alertTapped = [block copy];
}

- (void)showText:(showTextBlock)block{

    returnText = [block copy];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

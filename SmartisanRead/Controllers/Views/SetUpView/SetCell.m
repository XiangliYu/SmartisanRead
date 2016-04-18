//
//  setCell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "SetCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface SetCell (){

    SetCellTappedBlock cellTapped;
}
@end

@implementation SetCell

- (id)initWithFrame:(CGRect)frame Type:(int)type Title:(NSString *)title Content:(NSString *)content Button:(NSString *)button{

    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *btNormal;
        UIImage *btSelected;
        
        if (type==1) {
            btNormal = [UIImage imageNamed:@"usercenter_item_top_bg"];
            btSelected = [UIImage imageNamed:@"usercenter_item_top_pressed_bg"];
        }else if (type==2){
            btNormal = [UIImage imageNamed:@"usercenter_item_middle_bg"];
            btSelected = [UIImage imageNamed:@"usercenter_item_middle_pressed_bg"];
        }else if (type==3){
            btNormal = [UIImage imageNamed:@"usercenter_item_bottpm_bg"];
            btSelected = [UIImage imageNamed:@"usercenter_item_bottom_pressed_bg"];
        }
    
        UIButton *buttonView = [[UIButton alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
        [self addSubview:buttonView];
        [buttonView setBackgroundImage:[btNormal stretchableImageWithLeftCapWidth:18 topCapHeight:30] forState:UIControlStateNormal];
        [buttonView setBackgroundImage:[btSelected stretchableImageWithLeftCapWidth:18 topCapHeight:30] forState:UIControlStateSelected];
        [buttonView addTarget:self action:@selector(cellAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){30,0,self.width-20,self.height}];
        [buttonView addSubview:titleLabel];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:18];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:(CGRect){0,0,self.width-30,self.height}];
        [buttonView addSubview:contentLabel];
        contentLabel.text = content;
        contentLabel.textAlignment = NSTextAlignmentRight;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        
        UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:(CGRect){SCREEN_WIDTH-45,21,30,23}];
        [buttonView addSubview:buttonImage];
        buttonImage.image = [UIImage imageNamed:button];
 
    }

    return self;

}

- (void)setType:(int)type headImage:(NSString*)image Title:(NSString*)title{

    UIImage *btNormal;
    UIImage *btSelected;
    
    if (type==1) {
        btNormal = [UIImage imageNamed:@"usercenter_item_top_bg"];
        btSelected = [UIImage imageNamed:@"usercenter_item_top_pressed_bg"];
    }else if (type==2){
        btNormal = [UIImage imageNamed:@"usercenter_item_middle_bg"];
        btSelected = [UIImage imageNamed:@"usercenter_item_middle_pressed_bg"];
    }else if (type==3){
        btNormal = [UIImage imageNamed:@"usercenter_item_bottpm_bg"];
        btSelected = [UIImage imageNamed:@"usercenter_item_bottom_pressed_bg"];
    }
    
    UIButton *buttonView = [[UIButton alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
    [self addSubview:buttonView];
    [buttonView setBackgroundImage:[btNormal stretchableImageWithLeftCapWidth:18 topCapHeight:30] forState:UIControlStateNormal];
    [buttonView setBackgroundImage:[btSelected stretchableImageWithLeftCapWidth:18 topCapHeight:30] forState:UIControlStateSelected];
    [buttonView addTarget:self action:@selector(cellAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *headIcon = [[UIImageView alloc] initWithFrame:(CGRect){32,20,23,23}];
    headIcon.image = [UIImage imageNamed:image];
    [buttonView addSubview:headIcon];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){65,24,150,17}];
    [self addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-40,21,30,23}];
    [self addSubview:button];
    [button setBackgroundImage:[UIImage imageNamed:@"usercenter_arrow_normal"] forState:UIControlStateNormal];

}

- (void)cellAction:(UITapGestureRecognizer*)sender{

    if (cellTapped)cellTapped();
}

- (void)cellButtonTapped:(SetCellTappedBlock)block{

    cellTapped = [block copy];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

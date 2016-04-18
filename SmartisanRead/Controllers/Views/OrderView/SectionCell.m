//
//  SectionCell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/22.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "SectionCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface SectionCell (){
    
    ButtonTappedBlock moreTapped;
}
@end

@implementation SectionCell

- (void)setSectionTitle:(NSString *)title More:(NSString *)more Button:(NSString *)button{
    
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){17,11,200,17}];
    [self addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-54,12,50,15}];
    [self addSubview:moreLabel];
    moreLabel.text = more;
    moreLabel.font = [UIFont systemFontOfSize:14];
    moreLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    moreLabel.userInteractionEnabled = YES;
    
    UIImageView *bt = [[UIImageView alloc] initWithFrame:(CGRect){SCREEN_WIDTH-27,8,28,22}];
    bt.image = [UIImage imageNamed:button];
    [self addSubview:bt];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreAction:)];
    [self addGestureRecognizer:tap];
}

- (void)moreTapped:(ButtonTappedBlock)block{
    
    moreTapped = [block copy];
}

- (void)moreAction:(UITapGestureRecognizer*)sender{
    
    if (moreTapped) moreTapped();
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  SectionCell.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/22.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "SectionCell.h"

@interface SectionCell (){
    
    ButtonTappedBlock moreTapped;
}
@end

@implementation SectionCell

- (void)setSectionTitle:(NSString *)title More:(NSString *)more Button:(NSString *)button{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){17,11,200,17}];
    [self addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:(CGRect){321,12,50,15}];
    [self addSubview:moreLabel];
    moreLabel.text = more;
    moreLabel.font = [UIFont systemFontOfSize:14];
    moreLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    moreLabel.userInteractionEnabled = YES;
    
    UIImageView *bt = [[UIImageView alloc] initWithFrame:(CGRect){348,8,28,22}];
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

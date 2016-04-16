//
//  TypeCell.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/22.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "TypeCell.h"
#import "ViewAdditions.h"

@interface TypeCell (){
    
    ButtonTappedBlock typeCellTapped;

}

@end

@implementation TypeCell

- (void)setTypeImage:(NSString *)image Title:(NSString *)title{
    
    UIImageView *imageIcon = [[UIImageView alloc] initWithFrame:(CGRect){13,22,19,19}];
    [self addSubview:imageIcon];
    imageIcon.image = [UIImage imageNamed:image];
    
    UILabel *textlabel = [[UILabel alloc] initWithFrame:(CGRect){47,22,50,18}];
    [self addSubview:textlabel];
    textlabel.text = title;
    textlabel.font = [UIFont systemFontOfSize:18];
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){153,20,28,22}];
    [self addSubview:button];
    [button setImage:[UIImage imageNamed:@"usercenter_arrow_normal"] forState:UIControlStateNormal];
    
    UIView *rightLine = [[UIView alloc] initWithFrame:(CGRect){self.width-1,0,1,self.height}];
    rightLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self addSubview:rightLine];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:(CGRect){0,self.height-1,self.width,1}];
    bottomLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self addSubview:bottomLine];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(typeAction:)];
    [self addGestureRecognizer:tap];
    
}

- (void)typeAction:(UITapGestureRecognizer*)type{
    
    if (typeCellTapped) typeCellTapped();
}

- (void)typeCellTapped:(ButtonTappedBlock)block{
    
    typeCellTapped = [block copy];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

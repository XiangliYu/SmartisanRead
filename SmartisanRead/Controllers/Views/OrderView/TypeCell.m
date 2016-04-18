//
//  TypeCell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/22.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "TypeCell.h"

@interface TypeCell (){
    
    TypeTappedBlock typeCellTapped;

}

@end

@implementation TypeCell

- (void)setTypeImage:(NSString *)image Title:(NSString *)title Model:(TypeModel *)model{
    
    _model = model;
    
    UIImageView *imageIcon = [[UIImageView alloc] initWithFrame:(CGRect){13,20,23,23}];
    [self addSubview:imageIcon];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:image]];
    imageIcon.image = [UIImage imageWithData:data];
    
    UILabel *textlabel = [[UILabel alloc] initWithFrame:(CGRect){47,22,50,18}];
    [self addSubview:textlabel];
    textlabel.text = title;
    textlabel.font = [UIFont systemFontOfSize:18];
    
    UIButton *button = [[UIButton alloc] initWithFrame:(CGRect){175,20,28,22}];
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
    
    if (typeCellTapped) typeCellTapped(_model);
}

- (void)typeCellTapped:(TypeTappedBlock)block{
    
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

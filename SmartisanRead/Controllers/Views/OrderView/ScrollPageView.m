//
//  ImageViewAdditions.m
//  锤子科技论坛
//
//  Created by Xiangli Yu on 15-10-22.
//  Copyright (c) 2015年 Xinxin. All rights reserved.
//

#import "ScrollPageView.h"

@interface ScrollPageView (){

    ImageTappedBlock imageBlock;
}
@end

@implementation ScrollPageView

- (id)initWithFrame:(CGRect)frame setImage:(NSString *)imageStr{
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){0,0,self.width,self.height}];
        imageView.userInteractionEnabled = YES;
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self addSubview:imageView];
        [imageView setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"3dddbd32ae80eb5e9e16fc83dabcc102"]];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer*)gesture{

    if (imageBlock) imageBlock();
}

- (void)imageButtonTapped:(ButtonTappedBlock)block{

    imageBlock = [block copy];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

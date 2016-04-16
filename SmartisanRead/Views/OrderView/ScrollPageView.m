//
//  ImageViewAdditions.m
//  锤子科技论坛
//
//  Created by Oran Wu on 15-10-22.
//  Copyright (c) 2015年 Xinxin. All rights reserved.
//

#import "ScrollPageView.h"

@implementation ScrollPageView

- (id)initWithFrame:(CGRect)frame setImage:(UIImage *)image{
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = image;
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self addSubview:imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

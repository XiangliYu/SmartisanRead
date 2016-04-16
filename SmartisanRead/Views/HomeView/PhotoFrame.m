//
//  PhotoFrame.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "PhotoFrame.h"

@interface PhotoFrame (){

    UIBezierPath *photoFrame;

}

@end

@implementation PhotoFrame

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setImage:(NSString *)image{

    UIView *backView = [[UIView alloc] initWithFrame:(CGRect){0,0,64,64}];
    backView.layer.borderWidth = 1;
    backView.layer.borderColor = [UIColor colorWithWhite:0.85 alpha:1].CGColor;
    [self addSubview:backView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){4,4,56,56}];
    [backView addSubview:imageView];
    imageView.image = [UIImage imageNamed:image];
    imageView.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


@end

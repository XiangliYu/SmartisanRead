//
//  RefreshFooter.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/27.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "RefreshFooter.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)


@interface RefreshFooter (){

    UILabel *refreshText;
    NSString *str;
    NSMutableArray *pullArray;
    UIImageView *imageView;
    
    AnimationTappedBlock animationBlock;
    int index;

}

@end

@implementation RefreshFooter

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self refreshVeiw];
    }
    return self;
}

- (void)refreshVeiw{
    
    refreshText = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-240,32.5,200,15}];
    [self addSubview:refreshText];
    refreshText.textAlignment = NSTextAlignmentLeft;
    refreshText.font = [UIFont systemFontOfSize:15];
    
    imageView = [[UIImageView alloc] initWithFrame:(CGRect){SCREEN_WIDTH-275,5,22,70}];
    [self addSubview:imageView];
    
    pullArray = [[NSMutableArray alloc] init];
    
    for (int i=1; i<46; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pull_refresh_anim_%d",i]];
        [pullArray addObject:image];
    }
}

- (void)setTitle:(NSString *)title{
    
    refreshText.text = title;
    
}

- (void)setProgress:(float)progress{
    
    _progress = progress;
    refreshText.textColor = [UIColor colorWithWhite:0.1 alpha:progress];
    if (progress>=1) {
        progress=0.99;
    }
    index = progress*45/1;
    imageView.image = [pullArray objectAtIndex:index];
    
}

- (void)setAnimation{
    
    imageView.image = [UIImage imageNamed:@"pull_refresh_anim_46"];
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotation.duration = 0.4;
    rotation.delegate = self;
    rotation.cumulative = YES;
    rotation.repeatCount = 3;
    
    [imageView.layer addAnimation:rotation forKey:@"rotation"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (animationBlock) animationBlock();
}

- (void)animationDidStop:(AnimationTappedBlock)block{
    
    animationBlock = [block copy];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

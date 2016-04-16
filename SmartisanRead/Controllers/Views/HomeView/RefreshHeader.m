//
//  RefreshHeader.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/27.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "RefreshHeader.h"
#import "ViewAdditions.h"

@interface RefreshHeader (){

    UILabel *refreshText;
    NSString *str;
    NSMutableArray *pullArray;
    UIImageView *imageView;
    CABasicAnimation *rotation;
    
    AnimationTappedBlock animationBlock;
    
    int index;

}

@end

@implementation RefreshHeader

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        [self refreshVeiw];
    }
    return self;
}

- (void)refreshVeiw{
    
    refreshText = [[UILabel alloc] initWithFrame:(CGRect){135,32,200,20}];
    [self addSubview:refreshText];
    refreshText.textAlignment = NSTextAlignmentLeft;
    refreshText.font = [UIFont systemFontOfSize:15];
    
    imageView = [[UIImageView alloc] initWithFrame:(CGRect){100,7,22,70}];
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
    
    if (progress<0.2) {
        imageView.hidden = YES;
    }else
        imageView.hidden = NO;
    
    _progress = progress;
    refreshText.textColor = [UIColor colorWithWhite:0.1 alpha:progress];
    if (progress>=1) {
        progress=0.99;
    }else if (progress<=0){
        progress=0.01;
    }
    index = progress*45/1;
    imageView.image = [pullArray objectAtIndex:index];
    
}

- (void)setAnimation{
    
    imageView.image = [UIImage imageNamed:@"pull_refresh_anim_46"];
    
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = [NSNumber numberWithFloat:0 ];
    rotation.toValue = [NSNumber numberWithFloat: M_PI * 2];
    rotation.duration = 0.4;
    rotation.delegate = self;
    rotation.fillMode = kCAFillModeForwards;
    rotation.removedOnCompletion = NO;
    rotation.repeatCount = 3;
    
    [imageView.layer addAnimation:rotation forKey:@"rotation"];
    
}

- (void)animationDidStart:(CAAnimation *)theAnimation{}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (animationBlock) animationBlock();
}

- (void)animationDidStop:(AnimationTappedBlock)block{
    
    animationBlock = [block copy];
}


@end

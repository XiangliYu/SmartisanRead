//
//  ButtonView.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/2.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "ButtonView.h"

@interface ButtonView (){
    
    id<ButtonDelegate>_delegate;
    
    UIImageView *btBack;
    UIImageView *btFrame;
    UIImageView *button;
    
    float leftEdge;
    float rightEdge;
    
}
@end

@implementation ButtonView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        btBack = [[UIImageView alloc] initWithFrame:(CGRect){0,0,132.5,56}];
        btBack.image = [UIImage imageNamed:@"switch_ex_bottom"];
        btBack.userInteractionEnabled = YES;
        [self addSubview:btBack];
        
        btFrame = [[UIImageView alloc] initWithFrame:(CGRect){0,0,87.5,56}];
        btFrame.image = [UIImage imageNamed:@"switch_ex_frame"];
        btFrame.userInteractionEnabled = YES;
        [self addSubview:btFrame];
        
        button = [[UIImageView alloc] initWithFrame:(CGRect){0,0,132.5,56}];
        button.image = [UIImage imageNamed:@"switch_ex_unpressed"];
        button.userInteractionEnabled = YES;
        [btBack addSubview:button];
        
        leftEdge = btFrame.frame.origin.x+21;
        rightEdge = btFrame.frame.origin.x + btFrame.frame.size.width - 21;
        
        btBack.center = (CGPoint){leftEdge,self.height/2};
        
        UITapGestureRecognizer *buttonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonAction:)];
        [self addGestureRecognizer:buttonTap];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        pan.minimumNumberOfTouches = 1;

        
    }
    
    return self;
}

- (void)buttonAction:(UITapGestureRecognizer*)tap{
    
    if (btBack.center.x == rightEdge) {
        
        [UIView animateWithDuration:0.1
                         animations:^{
                             btBack.center = (CGPoint){leftEdge,btBack.center.y};
                         } completion:^(BOOL finished) {
                             [_delegate selectedRightBt];
                         }];
    }
    else if (btBack.center.x == leftEdge){
        
        [UIView animateWithDuration:0.1
                         animations:^{
                             btBack.center = (CGPoint){rightEdge,btBack.center.y};
                         } completion:^(BOOL finished) {
                             [_delegate selectedLeftBt];
                         }];
    }
}

- (void)panAction:(UIPanGestureRecognizer*)sender{
    
    CGPoint point = [sender locationInView:self];
    point.y = self.frame.size.height/2;
    
    if (point.x>18&point.x<65) {
        
        btBack.center = point;
    }
    
    if (sender.state==UIGestureRecognizerStateEnded) {
        
        if (point.x >21&point.x<=43) {
            
            btBack.center = (CGPoint){leftEdge,btBack.center.y};
        }else if (point.x>43&point.x<65){
            
            btBack.center = (CGPoint){rightEdge,btBack.center.y};
        }
    }
    
}

@end

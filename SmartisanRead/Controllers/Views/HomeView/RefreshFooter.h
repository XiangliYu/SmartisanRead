//
//  RefreshFooter.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/27.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AnimationTappedBlock)(void);

@interface RefreshFooter : UIView

@property (nonatomic, readwrite) float progress;

- (void)setTitle:(NSString*)title;
- (void)setAnimation;
- (void)animationDidStop:(AnimationTappedBlock)block;

@end
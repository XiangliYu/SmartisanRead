//
//  RefreshHeader.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/27.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AnimationTappedBlock)(void);

@interface RefreshHeader : UIView

@property (nonatomic, readwrite) float progress;

- (void)setTitle:(NSString*)title;
- (void)setAnimation;
- (void)animationDidStop:(AnimationTappedBlock)block;

@end

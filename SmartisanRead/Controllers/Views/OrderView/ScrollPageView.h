//
//  ImageViewAdditions.h
//  锤子科技论坛
//
//  Created by Xiangli Yu on 15-10-22.
//  Copyright (c) 2015年 Xinxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ImageTappedBlock)(void);

@interface ScrollPageView : UIImageView

- (id)initWithFrame:(CGRect)frame setImage:(NSString*)imageStr;
- (void)imageButtonTapped:(ButtonTappedBlock)block;

@end

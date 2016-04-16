//
//  Cell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/21.
//  Copyright © 2016年 MO. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Model.h"
typedef void (^ButtonTappedBlock)(void);
typedef void (^showTextBlock)(NSString *text);

@interface Cell : UIView

- (void)setModel:(Model*)model;
- (void)changeBtImage;
- (void)cellTapped:(ButtonTappedBlock)block;
- (void)changeBtImage:(ButtonTappedBlock)block;
- (void)alertTapped:(ButtonTappedBlock)block;
- (void)showText:(showTextBlock)block;
- (void)setSmallImage:(NSString*)image;

@end

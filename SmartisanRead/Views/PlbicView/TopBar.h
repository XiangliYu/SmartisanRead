//
//  TopBar.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonTappedBlock)(void);
@interface TopBar : UIView

- (void)setTitle:(NSString*)title;
- (void)setLeftbtTitle:(NSString*)title;
- (void)setRightbtTitle:(NSString*)title;
- (void)leftButtonTapped:(ButtonTappedBlock)block;
- (void)rightButtonTapped:(ButtonTappedBlock)block;

- (void)setReturnBt:(NSString*)btImage Title:(NSString*)title;
- (void)returnBtTapped:(ButtonTappedBlock)block;

@end

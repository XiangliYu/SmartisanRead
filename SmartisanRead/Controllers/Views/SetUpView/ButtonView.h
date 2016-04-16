//
//  ButtonView.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/2.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonDelegate <NSObject>

- (void)selectedLeftBt;
- (void)selectedRightBt;

@end

@interface ButtonView : UIImageView

@property(nonatomic,assign)id<ButtonDelegate> buttonDelegate;

@end
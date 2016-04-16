//
//  ButtonView.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/2.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonDelegate <NSObject>

- (void)selectedLeftBt;
- (void)selectedRightBt;

@end

@interface ButtonView : UIImageView

@property(nonatomic,assign)id<ButtonDelegate> buttonDelegate;

@end
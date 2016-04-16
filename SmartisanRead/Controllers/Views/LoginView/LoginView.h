//
//  LoginView.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/19.
//  Copyright © 2016年 MO. All rights reserved.
//

typedef void (^ButtonTappedBlock)(void);
#import <UIKit/UIKit.h>

@interface LoginView : UIView

- (void)buttonTapped:(ButtonTappedBlock)block;

@end

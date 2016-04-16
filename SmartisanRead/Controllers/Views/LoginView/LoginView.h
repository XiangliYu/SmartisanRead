//
//  LoginView.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

typedef void (^ButtonTappedBlock)(void);
#import <UIKit/UIKit.h>

@interface LoginView : UIView

- (void)buttonTapped:(ButtonTappedBlock)block;

@end

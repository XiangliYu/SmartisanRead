//
//  setCell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

typedef void (^SetCellTappedBlock)(void);
#import <UIKit/UIKit.h>

@interface SetCell : UIView

- (id)initWithFrame:(CGRect)frame Type:(int)type Title:(NSString*)title Content:(NSString*)content Button:(NSString*)button;
- (void)setType:(int)type headImage:(NSString*)image Title:(NSString*)title;
- (void)cellButtonTapped:(SetCellTappedBlock)block;

@end

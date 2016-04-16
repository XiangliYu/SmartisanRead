//
//  setCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/19.
//  Copyright © 2016年 MO. All rights reserved.
//

typedef void (^CellTappedBlock)(void);
#import <UIKit/UIKit.h>

@interface SetCell : UIView

- (id)initWithFrame:(CGRect)frame Type:(int)type Title:(NSString*)title Content:(NSString*)content Button:(NSString*)button;
- (void)setType:(int)type headImage:(NSString*)image Title:(NSString*)title Content:(NSString*)content;
- (void)cellButtonTapped:(CellTappedBlock)block;

@end

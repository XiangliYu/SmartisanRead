//
//  TypeCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/22.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonTappedBlock)(void);
@interface TypeCell : UIView

- (void)setTypeImage:(NSString*)image Title:(NSString*)title;
- (void)typeCellTapped:(ButtonTappedBlock)block;

@end

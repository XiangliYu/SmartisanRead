//
//  Cell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/21.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^ButtonTappedBlock)(void);
typedef void (^returnModelBlock)(CellModel *myModel);

@interface Cell : UITableViewCell
@property (nonatomic, strong) CellModel *model;
@property (nonatomic)BOOL change;

+ (float)CellHeight;
- (void)setModel:(CellModel*)model;
- (void)changeBtState:(CellModel*)model;
- (void)setSmallImage:(NSString*)image;
- (void)cellTapped:(returnModelBlock)block;
- (void)changeBtImage:(ButtonTappedBlock)block;
- (void)alertTapped:(ButtonTappedBlock)block;

@end

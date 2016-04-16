//
//  Cell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/21.
//  Copyright © 2016年 MO. All rights reserved.
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

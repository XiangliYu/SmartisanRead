//
//  HomeCell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/17.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CellTappedBlock)(IndexModel *model);
@interface HomeCell : UITableViewCell

@property (nonatomic, strong) IndexModel *model;

- (void)cellTapped:(CellTappedBlock)block;
- (void)setModel:(IndexModel*)model;
+ (float)cellHeight:(IndexModel*)model;
- (void)setPerson:(BOOL)person;

@end

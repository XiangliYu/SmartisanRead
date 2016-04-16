//
//  HomeCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCell : UITableViewCell

- (void)setModel:(HomeModel*)model;
+ (float)cellHeight:(HomeModel*)model;
- (void)setPerson:(BOOL)person;

@end

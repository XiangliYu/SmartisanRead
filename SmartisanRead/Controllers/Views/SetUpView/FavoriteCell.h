//
//  FavoriteCell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/7.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^returnFavBlock)(IndexModel *myModel);
@interface FavoriteCell : UITableViewCell

@property (nonatomic, strong) IndexModel *model;

- (void)cellTapped:(returnFavBlock)block;
+ (float)CellHeight;

@end

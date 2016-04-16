//
//  FavoriteCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/7.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^returnFavBlock)(IndexModel *myModel);
@interface FavoriteCell : UITableViewCell

@property (nonatomic, strong) IndexModel *model;

- (void)cellTapped:(returnFavBlock)block;
+ (float)CellHeight;

@end

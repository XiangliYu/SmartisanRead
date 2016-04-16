//
//  TypeCell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/22.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TypeTappedBlock)(TypeModel *model);
@interface TypeCell : UIView

@property (nonatomic, strong) TypeModel *model;
- (void)setTypeImage:(NSString*)image Title:(NSString*)title Model:(TypeModel*)model;
- (void)typeCellTapped:(TypeTappedBlock)block;

@end

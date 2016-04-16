//
//  TypeCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/22.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TypeTappedBlock)(TypeModel *model);
@interface TypeCell : UIView

@property (nonatomic, strong) TypeModel *model;
- (void)setTypeImage:(NSString*)image Title:(NSString*)title Model:(TypeModel*)model;
- (void)typeCellTapped:(TypeTappedBlock)block;

@end

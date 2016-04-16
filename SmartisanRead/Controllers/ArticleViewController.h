//
//  ArticleViewController.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/21.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (nonatomic, strong) CellModel *model;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic) int index;

@end

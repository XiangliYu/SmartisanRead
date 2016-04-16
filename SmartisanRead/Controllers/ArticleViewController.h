//
//  ArticleViewController.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/21.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (nonatomic, strong) CellModel *model;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic) int index;

@end

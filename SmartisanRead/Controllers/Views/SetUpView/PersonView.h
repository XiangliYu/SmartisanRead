//
//  PersonView.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/19.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

typedef void (^ButtonTappedBlock)(void);
#import <UIKit/UIKit.h>

@interface PersonView : UIView

- (void)setListNum:(NSString*)listNum;
- (void)setFavNum:(NSString*)favNum;

- (void)HeaderBtTapped:(ButtonTappedBlock)block;
- (void)ListBtTapped:(ButtonTappedBlock)block;
- (void)FavoriteBtTapped:(ButtonTappedBlock)block;
- (void)HistoryBtTapped:(ButtonTappedBlock)block;

@end

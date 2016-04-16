//
//  SectionCell.h
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/22.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonTappedBlock)(void);
@interface SectionCell : UIView

- (void)setSectionTitle:(NSString*)title More:(NSString*)more Button:(NSString*)button;
- (void)moreTapped:(ButtonTappedBlock)block;

@end

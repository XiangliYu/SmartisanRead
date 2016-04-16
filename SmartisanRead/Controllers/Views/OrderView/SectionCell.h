//
//  SectionCell.h
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/22.
//  Copyright © 2016年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonTappedBlock)(void);
@interface SectionCell : UIView

- (void)setSectionTitle:(NSString*)title More:(NSString*)more Button:(NSString*)button;
- (void)moreTapped:(ButtonTappedBlock)block;

@end

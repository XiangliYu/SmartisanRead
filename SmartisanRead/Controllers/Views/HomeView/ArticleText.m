//
//  ArticleText.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/4/3.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "ArticleText.h"
#define Width 375.

@implementation ArticleText

- (id)initWithText:(NSString *)str{

    self = [super initWithFrame:self.frame];
    if (self) {
        
        self.x = 18;
        self.width = Width-36;
        self.text = str;
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor colorWithWhite:0.3 alpha:1];
        self.numberOfLines = MAXFLOAT;
    
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        self.attributedText = string;

            
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

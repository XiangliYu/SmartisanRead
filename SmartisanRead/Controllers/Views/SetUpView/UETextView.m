//
//  UETextView.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/4.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "UETextView.h"

@implementation UETextView

- (id)initWithText:(NSString *)str{
    
    self = [super initWithFrame:self.frame];
    if (self) {
        
        self.x = 27;
        self.width = 300;
        self.text = str;
        self.font = [UIFont systemFontOfSize:13];
        self.textColor = [UIColor colorWithWhite:0.45 alpha:1];
        self.numberOfLines = MAXFLOAT;
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4];
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

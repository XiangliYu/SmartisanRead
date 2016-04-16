//
//  FavoriteCell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/7.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "FavoriteCell.h"

@interface FavoriteCell (){

    UILabel *title;
    UIImageView *headIcon;
    UILabel *name;
    UIView *cutLine;
    UILabel *date;
    UIView *bottomLine;
    
    returnFavBlock cellTapped;
}

@end

@implementation FavoriteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        title = [[UILabel alloc] initWithFrame:(CGRect){15,17,345,16}];
        [self.contentView addSubview:title];
        
        headIcon = [[UIImageView alloc] initWithFrame:(CGRect){15,45,18,18}];
        [self.contentView addSubview:headIcon];
        
        name = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:name];
        
        cutLine = [[UIView alloc] initWithFrame:CGRectZero];
        cutLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [self.contentView addSubview:cutLine];
        
        date = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:date];
        
        bottomLine = [[UIView alloc] initWithFrame:(CGRect){0,74,375,1}];
        bottomLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [self.contentView addSubview:bottomLine];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setModel:(IndexModel *)model{
    
    _model = model;

    title.text = model.title;
    title.font = [UIFont systemFontOfSize:17];
    title.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.headIcon]];
    headIcon.image = [UIImage imageWithData:data];
    headIcon.layer.cornerRadius = 9;
    headIcon.layer.masksToBounds = YES;
    headIcon.layer.borderWidth = 0.3;
    headIcon.layer.borderColor = [UIColor colorWithWhite:0.6 alpha:1].CGColor;

    name.x = 43;
    name.y = 46;
    name.text = model.name;
    name.font = [UIFont systemFontOfSize:13];
    name.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    [name sizeToFit];
    
    cutLine.x = name.right+15;
    cutLine.y = 47;
    cutLine.frame = (CGRect){cutLine.x,cutLine.y,1,14};
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:model.date];

    date.text = destDateString;
    date.font = [UIFont systemFontOfSize:13];
    date.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    date.x = cutLine.right+15;
    date.y = 46;
    [date sizeToFit];
}

- (void)cellAction:(UITapGestureRecognizer*)tap{
    
    if (cellTapped) cellTapped(_model);
}

- (void)cellTapped:(returnFavBlock)block{
    
    cellTapped = [block copy];
}


+ (float)CellHeight{

    return 75;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

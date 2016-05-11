//
//  HomeCell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/17.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "HomeCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)


@interface HomeCell(){

    UIImageView *headIcon;
    UILabel *name;
    UILabel *recommend;
    UIView *cutLine;
    UILabel *date;
    UILabel *title;
    UILabel *content;
    UIView *background;
    UIView *bottomLine;
    
    CellTappedBlock cellTapped;
}

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        headIcon = [[UIImageView alloc] initWithFrame:(CGRect){19,16,22,22}];
        [self.contentView addSubview:headIcon];
        
        name = [[UILabel alloc] initWithFrame:(CGRect){52,21,200,15}];
        [self.contentView addSubview:name];
        
        recommend = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-147,21,100,17}];
        [self.contentView addSubview:recommend];
  
        cutLine = [[UIView alloc] initWithFrame:(CGRect){SCREEN_WIDTH-88,23,1,13}];
        [self.contentView addSubview:cutLine];
        
        date = [[UILabel alloc] initWithFrame:(CGRect){SCREEN_WIDTH-81,20,70,18}];
        [self.contentView addSubview:date];
        
        title = [[UILabel alloc] init];
        [self.contentView addSubview:title];

        content = [[UILabel alloc] init];
        [self.contentView addSubview:content];

        bottomLine = [[UIView alloc] init];
        [self.contentView addSubview:bottomLine];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.contentView addGestureRecognizer:tap];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setModel:(IndexModel *)model{
    
    _model = model;
    
    for (UIView * view in self.contentView.subviews) {
        if (view.tag>=100) {
            [view removeFromSuperview];
        }
    }
    
    [headIcon setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"3dddbd32ae80eb5e9e16fc83dabcc102"]];
    headIcon.layer.borderWidth = 0.3;
    headIcon.layer.cornerRadius = 11;
    headIcon.layer.masksToBounds = YES;
    
    name.text = model.name;
    name.font = [UIFont systemFontOfSize:12];
    name.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    recommend.text = @"编辑推荐";
    recommend.font = [UIFont systemFontOfSize:13];
    recommend.textColor = [UIColor colorWithRed:0.73 green:0.317 blue:0.313 alpha:1];
    
    cutLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    NSTimeInterval time=[model.date doubleValue]+28800;
    NSDate *_date=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    date.text = [dateFormatter stringFromDate:_date];
    date.font = [UIFont systemFontOfSize:12];
    date.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    
    title.font = [UIFont systemFontOfSize:16];
    title.numberOfLines = MAXFLOAT;
    title.x = 20;
    title.y = 53;
    title.width = SCREEN_WIDTH-40;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:model.title];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,[model.title length])];
    title.attributedText = attributedString;
    [title sizeToFit];
    
    content.x = 20;
    content.y = title.bottom+12;
    content.frame = (CGRect){content.x,content.y,SCREEN_WIDTH-40,62};
    content.textColor = [UIColor colorWithWhite:0.45 alpha:1];
    content.font = [UIFont systemFontOfSize:14];
    content.numberOfLines = 3;
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:model.content];
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle2 setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle2 setLineSpacing:4];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle2 range:NSMakeRange(0,[model.content length])];
    content.attributedText = attributedString2;
    [content sizeToFit];
    
    for (int i=0; i<model.images.count; i++) {
            
        NSString *str = [model.images objectAtIndex:i];
        float width = 65;
        
        if (str.length>0) {
            
            if (model.images==0) {
                background.height=0;
            }else{
                background = [[UIView alloc] initWithFrame:(CGRect){20+(width+8)*i,content.bottom+20,width,width}];
                background.tag = 100+i;
                background.layer.borderWidth = 1;
                background.layer.borderColor = [UIColor colorWithWhite:0.85 alpha:1].CGColor;
                [self.contentView addSubview:background];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){4,4,width-8,width-8}];
                [imageView setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"3dddbd32ae80eb5e9e16fc83dabcc102"]];
                imageView.contentMode = UIViewContentModeScaleToFill;
                [background addSubview:imageView];
            }
        }
    }

    if (model.images==0) {
        bottomLine.y = content.bottom+15;
    }else{
        bottomLine.y = content.bottom+20+background.height+15;
    }
    
    bottomLine.frame = (CGRect){0,bottomLine.y,SCREEN_WIDTH,1};
    bottomLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];

}

+ (float)cellHeight:(IndexModel *)model{

    float height = 0;
    height += 55;
    
    NSString *str = model.title;
    CGSize titleSize = [str boundingRectWithSize:(CGSize){SCREEN_WIDTH-40,MAXFLOAT}
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                         context:nil].size;
    
    height += titleSize.height+5;
    height += 62+8;
    if (model.images==0) {
        height += 15+1;
    }else{
        height += 20+65+15+1;
    }
    
    return height;
}

- (void)setPerson:(BOOL)person{

    if (person==YES) {
        recommend.hidden = YES;
        cutLine.hidden = YES;
    }

}

- (void)cellTapped:(CellTappedBlock)block{

    cellTapped = [block copy];
}

- (void)tapAction:(UITapGestureRecognizer*)gesture{

    if (cellTapped) cellTapped(_model);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

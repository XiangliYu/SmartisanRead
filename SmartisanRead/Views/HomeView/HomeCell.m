//
//  HomeCell.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "HomeCell.h"
#import "ViewAdditions.h"
#import "PhotoFrame.h"
#define CellWidth 375.f

@interface HomeCell(){

    UIImageView *headIcon;
    UILabel *name;
    UILabel *recommend;
    UIView *cutLine;
    UILabel *date;
    UILabel *title;
    UILabel *content;
    UIView *bottomLine;
    
}

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        headIcon = [[UIImageView alloc] initWithFrame:(CGRect){19,16,22,22}];
        [self.contentView addSubview:headIcon];
        
        name = [[UILabel alloc] initWithFrame:(CGRect){52,21,200,15}];
        [self.contentView addSubview:name];
        
        recommend = [[UILabel alloc] initWithFrame:(CGRect){228,21,100,17}];
        [self.contentView addSubview:recommend];
  
        cutLine = [[UIView alloc] initWithFrame:(CGRect){283,22,1,13}];
        [self.contentView addSubview:cutLine];
        
        date = [[UILabel alloc] initWithFrame:(CGRect){291,20,70,18}];
        [self.contentView addSubview:date];
        
        title = [[UILabel alloc] init];
        [self.contentView addSubview:title];

        content = [[UILabel alloc] init];
        [self.contentView addSubview:content];

        bottomLine = [[UIView alloc] init];
        [self.contentView addSubview:bottomLine];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setModel:(HomeModel *)model{
    
    int index;
    
    PhotoFrame *photo = [self viewWithTag:100+index];
    [photo removeFromSuperview];
    

    headIcon.image = [UIImage imageNamed:model.headIcon];
    headIcon.layer.cornerRadius = 11;
    headIcon.layer.masksToBounds = YES;
    
    name.text = model.name;
    name.font = [UIFont systemFontOfSize:12];
    name.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    recommend.text = @"编辑推荐";
    recommend.font = [UIFont systemFontOfSize:12];
    recommend.textColor = [UIColor colorWithRed:0.73 green:0.317 blue:0.313 alpha:1];
    
    cutLine.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    date.text = model.date;
    date.font = [UIFont systemFontOfSize:12];
    date.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    
    title.text = model.title;
    title.font = [UIFont systemFontOfSize:16];
    title.numberOfLines = MAXFLOAT;
    title.x = 20;
    title.y = 53;
    title.width = CellWidth-40;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:model.title];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,[model.title length])];
    title.attributedText = attributedString;
    [title sizeToFit];
    
    content.x = 20;
    content.y = title.bottom+12;
    content.frame = (CGRect){content.x,content.y,CellWidth-40,62};
    content.text = model.content;
    content.lineBreakMode = NSLineBreakByTruncatingTail;
    content.textColor = [UIColor colorWithWhite:0.45 alpha:1];
    content.font = [UIFont systemFontOfSize:14];
    content.numberOfLines = 3;
    
    for (NSString *images in model.images) {
        
        float width = 65;
        for (index=0; index<model.images.count; index++) {
            
            PhotoFrame *imageView = [[PhotoFrame alloc] initWithFrame:(CGRect){20+(width+8)*index,content.bottom+20,width,width}];
            imageView.tag = 100+index;
            [self.contentView addSubview:imageView];
            [imageView setImage:images];
            
        }
    }
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:model.content];
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle2 setLineSpacing:4];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle2 range:NSMakeRange(0,[model.content length])];
    content.attributedText = attributedString2;
    [content sizeToFit];
    

    bottomLine.y = content.bottom+20+65+15;
    bottomLine.frame = (CGRect){0,bottomLine.y,CellWidth,1.5};
    bottomLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.5];

}

+ (float)cellHeight:(HomeModel *)model{

    float height = 0;
    height += 55;
    
    NSString *str = model.title;
    CGSize titleSize = [str boundingRectWithSize:(CGSize){CellWidth-40,MAXFLOAT}
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                         context:nil].size;
    
    height += titleSize.height+5;
    height += 62+8;
    height += 20+65+15+1.5;
    
    return height;
}

- (void)setPerson:(BOOL)person{

    if (person==YES) {
        recommend.hidden = YES;
        cutLine.hidden = YES;
    }

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

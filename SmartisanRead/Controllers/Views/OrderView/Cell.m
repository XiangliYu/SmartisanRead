//
//  Cell.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/21.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "Cell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface Cell (){

    UIImageView *headIcon;
    UILabel *titleLabel;
    UILabel *noteLabel;
    UIButton *smallIcon;
    UIView *bottomLine;
    UIButton *rightBt;
    
    returnModelBlock cellTapped;
    ButtonTappedBlock changeBtImage;
    ButtonTappedBlock alertTapped;
    returnModelBlock returnModel;
}

@end

@implementation Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.height = 62;
        
        headIcon = [[UIImageView alloc] initWithFrame:(CGRect){17,10,44,44}];
        [self addSubview:headIcon];
       
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:titleLabel];
        
        noteLabel = [[UILabel alloc] initWithFrame:(CGRect){71,38,200,15}];
        [self addSubview:noteLabel];
        
        smallIcon = [[UIButton alloc] initWithFrame:CGRectZero];
        [self addSubview:smallIcon];
        
        rightBt = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-78,15,64,32}];
        [self addSubview:rightBt];
        
        bottomLine = [[UIView alloc] initWithFrame:(CGRect){72,self.height-1.5,SCREEN_WIDTH-85,1.5}];
        [self addSubview:bottomLine];
        bottomLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellAction:)];
        [self addGestureRecognizer:tap];
        
        [CellSQL creatTable];
    }
    return self;
}

- (void)setModel:(CellModel *)model{
    _model = model;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.headIcon]];
    headIcon.image = [UIImage imageWithData:data];
    headIcon.layer.cornerRadius = 22;
    headIcon.layer.masksToBounds = YES;
    
    titleLabel.x = 72;
    titleLabel.y = 12;
    titleLabel.text = model.name;
    titleLabel.font = [UIFont systemFontOfSize:18];
    [titleLabel sizeToFit];

    noteLabel.text = model.title;
    noteLabel.font = [UIFont systemFontOfSize:13];
    noteLabel.textColor = [UIColor colorWithWhite:0.55 alpha:1];

    smallIcon.x = titleLabel.right +12;
    [smallIcon setFrame:(CGRect){smallIcon.x,14,33,17}];
    [smallIcon setBackgroundImage:[UIImage imageNamed:@"smallbt"] forState:UIControlStateNormal];
    [smallIcon setTitle:model.smallBt forState:UIControlStateNormal];
    [smallIcon setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
    smallIcon.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [rightBt setBackgroundImage:[UIImage imageNamed:@"orderBt"] forState:UIControlStateNormal];
    [rightBt addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
    [rightBt setTitle:@"订阅" forState:UIControlStateNormal];
    [rightBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [UIFont systemFontOfSize:13];
    
    if (noteLabel.text.length==0) {
        
        titleLabel.y=20;
        [smallIcon setBackgroundImage:nil forState:UIControlStateNormal];
    }
    
    if (cellTapped!=nil) {
        
        cellTapped(model);
    }
}

+ (float)CellHeight{

    return 62;
}

- (void)setSmallImage:(NSString *)image{
    
    smallIcon.y = titleLabel.y+3;
    smallIcon.width = 15;
    smallIcon.height = 15;
    [smallIcon setTitle:nil forState:UIControlStateNormal];
    [smallIcon setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    if (noteLabel.text.length==0) {
        
        [smallIcon setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

- (void)changeBtState:(CellModel *)model{
    
    if ([LoginTool isLoggedIn ]) {
        
        if (model.state==NO) {
            
            UIImage *btImage = [UIImage imageNamed:@"orderBt"];
            [rightBt setTitle:@"订阅" forState:UIControlStateNormal];
            [rightBt setBackgroundImage:btImage forState:UIControlStateNormal];
            model.state=YES;
            
        }else if(model.state==YES){
            
            UIImage *btImage = [UIImage imageNamed:@"orderBtSeleced"];
            [rightBt setTitle:nil forState:UIControlStateNormal];
            [rightBt setBackgroundImage:btImage forState:UIControlStateNormal];
            model.state=NO;
        }
    }else{
        [self alertAction];
    }
    
    if (model.state==NO) {
        
        [CellSQL insertOrderModel:model];
    }
}

- (void)cellAction:(UITapGestureRecognizer*)tap{
    
    if (cellTapped) cellTapped(_model);
}

- (void)cellTapped:(returnModelBlock)block{
    
    cellTapped = [block copy];
}

- (void)changeImage{
    
    if (changeBtImage) changeBtImage();
}

- (void)changeBtImage:(ButtonTappedBlock)block{
    
    changeBtImage = [block copy];
}

- (void)alertAction{
    
    if (alertTapped) alertTapped();
}

- (void)alertTapped:(ButtonTappedBlock)block{
    
    alertTapped = [block copy];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

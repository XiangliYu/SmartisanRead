//
//  ViewAdditions.m
//  锤子科技论坛
//
//  Created by Oran Wu on 15-10-20.
//  Copyright (c) 2015年 Xinxin. All rights reserved.
//

#import "ViewAdditions.h"

@implementation UIView(Additions)

- (void)setX:(float)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    [self setFrame:frame];
    
}

- (void)setY:(float)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    [self setFrame:frame];
}

- (void)setBottom:(float)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    [self setFrame:frame];

}

- (void)setRight:(float)right{
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    [self setFrame:frame];
}



- (void)setTop:(float)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    [self setFrame:frame];

}

- (void)setLeft:(float)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    [self setFrame:frame];

}

- (void)setWidth:(float)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    [self setFrame:frame];
}

- (void)setHeight:(float)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    [self setFrame:frame];
}

- (void)setCenterX:(float)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(float)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (float)x{
    return self.frame.origin.x;
}

- (float)y{
    return self.frame.origin.y;
}

- (float)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (float)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (float)width{
    return self.frame.size.width;
}

- (float)height{
    return self.frame.size.height;
}

- (float)centerX{
    return self.center.x;
}

- (float)centerY{
    return self.center.y;
}

@end

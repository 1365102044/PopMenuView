//
//  MenuTableViewCell.m
//  PopMenuTableView
//
//  Created by 孔繁武 on 16/8/2.
//  Copyright © 2016年 KongPro. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell {
    UIView *_lineView;
    UILabel *descLable;
    UIImageView *descImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    _lineView = lineView;
    [self addSubview:lineView];
    self.backgroundColor = [UIColor clearColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    descLable = [[UILabel alloc]init];
    descLable.font = [UIFont systemFontOfSize:14];
    descLable.textColor = [UIColor whiteColor];
    [self addSubview:descLable];
    
    descImageView = [[UIImageView alloc]init];
    [self addSubview:descImageView];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (!_menuModel.imageName) {
        descLable.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        descLable.textAlignment = NSTextAlignmentCenter;
    }else{
        CGFloat IW = 22;
        descImageView.frame = CGRectMake(12,(self.bounds.size.height - IW)/2 , IW, IW);
        descLable.frame = CGRectMake(CGRectGetMaxX(descImageView.bounds)+15, 0, self.bounds.size.width - CGRectGetMaxX(descImageView.bounds), self.bounds.size.height);
        descLable.textAlignment = NSTextAlignmentLeft;
    }
    
    _lineView.frame = CGRectMake(4, self.bounds.size.height - 1, self.bounds.size.width - 8, 0.5);
    
}

- (void)setMenuModel:(MenuModel *)menuModel{
    _menuModel = menuModel;
    descImageView.image = [UIImage imageNamed:menuModel.imageName];
    descLable.text = menuModel.itemName;
    
}

@end

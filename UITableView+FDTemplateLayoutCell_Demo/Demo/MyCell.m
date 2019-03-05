//
//  MyCell.m
//  UITableView+FDTemplateLayoutCell_Demo
//
//  Created by 陈会超 on 2018/3/7.
//  Copyright © 2018年 陈会超. All rights reserved.
//
//  cell
//

#import "MyCell.h"

#import "Masonry.h"

@interface MyCell ()

@end

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initCellOfSubViews];
        [self setSubViewsAtuoLayout];
    }
    
    return self;
}

- (void)initCellOfSubViews {
    
    UIView *baseView = [[UIView alloc] init];
    baseView.backgroundColor = [UIColor colorWithRed:223/255.0 green:234/255.0 blue:248/255.0 alpha:1.0];
    baseView.layer.masksToBounds = YES;
    baseView.layer.cornerRadius = 5;
    [self.contentView addSubview:baseView];
    _baseView = baseView;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = [UIFont systemFontOfSize:18.0];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = [UIColor blackColor];
    [_baseView addSubview:timeLabel];
    _timeLabel = timeLabel;
    
    UILabel *placeStrLabel = [[UILabel alloc] init];
    placeStrLabel.font = [UIFont systemFontOfSize:18.0];
    placeStrLabel.textAlignment = NSTextAlignmentLeft;
    placeStrLabel.textColor = [UIColor blackColor];
    [_baseView addSubview:placeStrLabel];
    _placeStrLabel = placeStrLabel;
    
    UILabel *placeLabel = [[UILabel alloc] init];
    placeLabel.font = [UIFont systemFontOfSize:18.0];
    placeLabel.textAlignment = NSTextAlignmentLeft;
    placeLabel.textColor = [UIColor blackColor];
    placeLabel.numberOfLines = 0;
    [_baseView addSubview:placeLabel];
    _placeLabel = placeLabel;
    
    UILabel *statusLabel = [[UILabel alloc] init];
    statusLabel.font = [UIFont systemFontOfSize:18.0];
    statusLabel.textAlignment = NSTextAlignmentLeft;
    statusLabel.textColor = [UIColor blackColor];
    [_baseView addSubview:statusLabel];
    _statusLabel = statusLabel;
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.font = [UIFont systemFontOfSize:18.0];
    typeLabel.textAlignment = NSTextAlignmentLeft;
    typeLabel.textColor = [UIColor blackColor];
    [_baseView addSubview:typeLabel];
    _typeLabel = typeLabel;
    
    UILabel *reasonStrLabel = [[UILabel alloc] init];
    reasonStrLabel.font = [UIFont systemFontOfSize:18.0];
    reasonStrLabel.textColor = [UIColor blackColor];
    reasonStrLabel.textAlignment = NSTextAlignmentLeft;
    [_baseView addSubview:reasonStrLabel];
    _reasonStrLabel = reasonStrLabel;
    
    UILabel *reasonLabel = [[UILabel alloc] init];
    reasonLabel.font = [UIFont systemFontOfSize:18.0];
    reasonLabel.textColor = [UIColor blackColor];
    reasonLabel.textAlignment = NSTextAlignmentLeft;
    reasonLabel.numberOfLines = 0;
    [_baseView addSubview:reasonLabel];
    _reasonLabel = reasonLabel;
}

- (void)setSubViewsAtuoLayout {
    
    [_baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.bottom.mas_offset(-10);
    }];
    
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        
    }];
    
    
    [_placeStrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(10);
        make.left.mas_offset(10);
        make.width.mas_equalTo(45);
    }];
    
    [_placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_placeStrLabel.mas_top);
        make.left.equalTo(_placeStrLabel.mas_right).offset(0);
        make.right.mas_offset(-10);
    }];
    
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_placeLabel.mas_bottom).offset(10);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
    }];
    
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_statusLabel.mas_bottom).offset(10);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
    }];
    
    _reasonStrConstraint = [NSLayoutConstraint constraintWithItem:_reasonStrLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_typeLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    [_reasonStrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(_typeLabel.mas_bottom).offset(10);
        make.left.mas_offset(10);
        make.width.mas_equalTo(45);
    }];
    
    [_reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_reasonStrLabel.mas_top);
        make.left.equalTo(_reasonStrLabel.mas_right).offset(0);
        make.right.mas_offset(-10);
        make.bottom.mas_offset(-10);
    }];
    
    [self.contentView addConstraints:[NSArray arrayWithObjects:_reasonStrConstraint, nil]];
}

- (void)setModel:(MyModel *)model {
    
    _timeLabel.text = [NSString stringWithFormat:@"时间  %@", model.contentDict[@"time"]];
    
    _placeStrLabel.text = @"地点";
    _placeLabel.text = model.contentDict[@"place"];
    
    _statusLabel.text = [NSString stringWithFormat:@"状态  %@", model.contentDict[@"status"]];
    
    _typeLabel.text =  [NSString stringWithFormat:@"方式  %@", model.contentDict[@"type"]];
    
    if ([model.contentDict[@"reason"] length] > 0) {
        
        _reasonStrConstraint.constant = 10;
        _reasonStrLabel.text = @"原因";
        _reasonLabel.text = model.contentDict[@"reason"];
    } else {
        
        _reasonStrConstraint.constant = 0;
        _reasonStrLabel.text = nil;
        _reasonLabel.text = nil;
    }
}

@end

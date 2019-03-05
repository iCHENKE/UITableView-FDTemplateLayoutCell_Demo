//
//  MyCell.h
//  UITableView+FDTemplateLayoutCell_Demo
//
//  Created by 陈会超 on 2018/3/7.
//  Copyright © 2018年 陈会超. All rights reserved.
//
//  cell
//

#import <UIKit/UIKit.h>

#import "MyModel.h"

@interface MyCell : UITableViewCell

@property (strong, nonatomic) UIView *baseView;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *placeStrLabel;
@property (strong, nonatomic) UILabel *placeLabel;
@property (strong, nonatomic) UILabel *statusLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *reasonStrLabel;
@property (strong, nonatomic) UILabel *reasonLabel;
@property (weak, nonatomic) NSLayoutConstraint *reasonStrConstraint;

- (void)setModel:(MyModel *)model;

@end

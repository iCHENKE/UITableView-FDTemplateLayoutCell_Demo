//
//  MyModel.h
//  UITableView+FDTemplateLayoutCell_Demo
//
//  Created by 陈会超 on 2018/3/7.
//  Copyright © 2018年 陈会超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property (copy, nonatomic) NSDictionary *contentDict;

+ (instancetype) modelWithDictionary:(NSDictionary *) dictionary;

- (instancetype) initModelWithDictionary:(NSDictionary *) dictionary;

@end

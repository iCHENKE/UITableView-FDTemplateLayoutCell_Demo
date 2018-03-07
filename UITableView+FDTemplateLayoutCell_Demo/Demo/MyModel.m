//
//  MyModel.m
//  UITableView+FDTemplateLayoutCell_Demo
//
//  Created by 陈会超 on 2018/3/7.
//  Copyright © 2018年 陈会超. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    
    return [[self alloc] initModelWithDictionary:dictionary];
}

- (instancetype)initModelWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        
        self.contentDict = [NSDictionary dictionaryWithDictionary:dictionary];
    }
    return self;
}

@end

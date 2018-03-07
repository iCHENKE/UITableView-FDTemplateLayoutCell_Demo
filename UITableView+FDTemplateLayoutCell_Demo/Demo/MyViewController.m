//
//  MyViewController.m
//  UITableView+FDTemplateLayoutCell_Demo
//
//  Created by 陈会超 on 2018/3/7.
//  Copyright © 2018年 陈会超. All rights reserved.
//

#import "MyViewController.h"

#import "Masonry.h"
#import "MyCell.h"
#import "MyModel.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface MyViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *listData;
    UITableView *listTab;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTab];
    [self getTestData];
}

- (void)initTab {
    
    listData = [NSMutableArray array];
    
    listTab = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    listTab.delegate = self;
    listTab.dataSource = self;
    listTab.backgroundColor = [UIColor whiteColor];
    listTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [listTab registerClass:[MyCell class] forCellReuseIdentifier:@"MyCell"];
    [self.view addSubview:listTab];
    
    [listTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - 测试数据
- (void)getTestData {
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"TestData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *testData = rootDict[@"testData"];
    
    for (NSDictionary *tempDic in testData) {
        [listData addObject:[MyModel modelWithDictionary:tempDic]];
    }
    [listTab reloadData];
}

#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFootInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [listTab fd_heightForCellWithIdentifier:@"MyCell" cacheByIndexPath:indexPath configuration:^(MyCell *cell) {
        [self setModelOfCell:cell atIndexPath:indexPath];
    }];
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCell *cell = [listTab dequeueReusableCellWithIdentifier:@"MyCell"];
    [self setModelOfCell:cell atIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModelOfCell:(MyCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.model = listData[indexPath.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

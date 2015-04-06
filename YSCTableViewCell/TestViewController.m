//
//  TestViewController.m
//  YSCTableViewCell
//
//  Created by YangShengchao on 15/4/6.
//  Copyright (c) 2015年 YangShengchao. All rights reserved.
//

#import "TestViewController.h"
#import "YSCTableViewCell.h"

@interface TestViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *configItemArray;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.configItemArray = @[@[@"图片显示",@"2G/3G/4G网络是否显示高清图片",@"清理缓存"],
                             @[@"安全中心",@"密码修改",@"手机绑定",@"邮箱绑定"],
                             @[@"关于",@"服务条款",@"版本更新",@"意见反馈",@"关于我们"]];
    
    //设置tableview
    [self.tableView registerNib:[UINib nibWithNibName:@"YSCTableViewCell" bundle:nil] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.separatorInset = AUTOLAYOUT_EDGEINSETS(0, 20, 0, 0);
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:AUTOLAYOUT_CGRECT(0, 0, 0, 20)];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:[self edgeInsetsOfCellSeperator]];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:[self edgeInsetsOfCellSeperator]];
    }
}

- (UIEdgeInsets)edgeInsetsOfCellSeperator {
    return UIEdgeInsetsZero;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.configItemArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.configItemArray[section] count];
}
// HEADER
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTOLAYOUT_LENGTH(20); //注意：在Group Style下，必须要设置Header不为0的数字！设置为0会有默认40个像素高度的view
}
// CELL
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTOLAYOUT_LENGTH(80);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSCTableViewCell *cell = (YSCTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.style = YSCTableViewCellStyleTitle;
    cell.subtitleLeftTitleLabel.text = self.configItemArray[indexPath.section][indexPath.row];
    
    //1.
    if (indexPath.row == 0) {
        cell.style = YSCTableViewCellStyleIcon | YSCTableViewCellStyleArrow | YSCTableViewCellStyleSubtitleRight;
        cell.iconImageView.image = [UIImage imageNamed:@"icon_test"];
        cell.arrowImageView.image = [UIImage imageNamed:@"arrow_right"];
        cell.subtitleLeftTitleLabel.font = AUTOLAYOUT_FONT(30);
        cell.subtitleLeftTitleLabel.textColor = [UIColor blackColor];
        cell.subtitleLeftLabel.text = @"icon is just for test!";
        cell.subtitleRightLabel.text = @"TEST";
    }
    else {
        cell.style = YSCTableViewCellStyleArrow;
        cell.subtitleLeftTitleLabel.font = AUTOLAYOUT_FONT(28);
        cell.subtitleLeftTitleLabel.textColor = RGB(92, 92, 92);
    }
    
    //2. 控制cell特殊内容的显示
    if (0 == indexPath.section && 1 == indexPath.row) {//是否显示高清图片
        cell.style = YSCTableViewCellStyleSwitch;
        [cell.stateSwitch setOn:YES];
        cell.stateChanged = ^(BOOL state) {
            
        };
    }
    else if (1 == indexPath.section && 2 == indexPath.row) {//手机是否绑定了
        cell.style = YSCTableViewCellStyleSwitch;
        cell.stateChanged = ^(BOOL state) {
            NSLog(@"state = [%d,%ld]", state, (long)indexPath.row);
            //TODO:
        };
    }
    else if (1 == indexPath.section && 3 == indexPath.row) {//邮箱是否绑定了
        cell.style = YSCTableViewCellStyleSwitch;
        cell.stateChanged = ^(BOOL state) {
            NSLog(@"state = [%d,%ld]", state, (long)indexPath.row);
            //TODO:
        };
    }
    else if (2 == indexPath.section && 2 == indexPath.row) {
        cell.style = YSCTableViewCellStyleSubtitleRight | YSCTableViewCellStyleArrow;
        cell.subtitleRightLabel.text = @"版本号：1.0";
    }

    return cell;
}
// FOOTER
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected [%d, %d]", indexPath.section, indexPath.row);
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:[self edgeInsetsOfCellSeperator]];
    }
}

@end

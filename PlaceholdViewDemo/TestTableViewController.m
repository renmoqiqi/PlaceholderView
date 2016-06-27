//
//  TestTableViewController.m
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/23.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import "TestTableViewController.h"
#import "UIViewController+PlaceholderView.h"

@implementation TestTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self showfailureViewInView:self.tableView tapButtonBlock:^{

        [self hidefailureViewFromView:self.tableView];
    }];



}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%f,%f",self.tableView.contentInset.top,self.tableView.contentInset.bottom);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

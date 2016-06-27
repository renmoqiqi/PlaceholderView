//
//  ViewController.m
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/21.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+PlaceholderView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *testTableView;
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.tabBarController.tabBar.hidden = YES;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.tabBarController.tabBar.frame = CGRectMake(0, self.view.bounds.size.height , self.view.bounds.size.width, 49);
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self showfailureViewInView:self.testTableView tapButtonBlock:^{

}];

    [self showfailureViewInView:self.testView tapButtonBlock:^{

    }];


}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%f,%f",self.testTableView.contentInset.top,self.testTableView.contentInset.bottom);
//    UIWindow *appKeyWindow = [UIApplication sharedApplication].keyWindow;
//    UIView *appBaseView = appKeyWindow.rootViewController.view;
//    CGRect viewControllerFrame =  [appBaseView convertRect:appBaseView.bounds toView:appKeyWindow];
//    NSLog(@"%f,%f",viewControllerFrame.origin.y,viewControllerFrame.size.height);

}

@end

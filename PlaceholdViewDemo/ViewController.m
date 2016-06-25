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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
[self showfailureViewInView:self.view tapButtonBlock:^{

}];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

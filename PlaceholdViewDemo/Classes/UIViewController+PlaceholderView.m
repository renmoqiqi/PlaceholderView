//
//  UIViewController+PlaceholderView.m
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/22.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import "UIViewController+PlaceholderView.h"
#import "UKPlaceholderView.h"

#pragma mark

static const CGFloat kTitleFontSize = 16.f;
static const CGFloat kVerticalSpace = 15.f;
static NSString *const titleLabelText = @"数据加载失败";
static NSString *const detailsLabelText = @"请在刷新下试试看";

#define KPlaceholderImage [UIImage imageNamed:@"cover"]
#define KPlaceholderViewTapButtonImage [UIImage imageNamed:@"testImage"]
#define KTitleLabelColor [UIColor colorWithRed:86/255.0 green:86/255.0 blue:86/255.0 alpha:1.0]

static NSString *const UKPlaceholderViewKeyPathContentInset = @"contentInset";


#pragma mark

@implementation UIViewController (PlaceholderView)

- (void)showfailureViewInView:(UIView *)view tapButtonBlock:(void(^)(void))tapButtonBlock
{
    UKPlaceholderView *placeholderView = [UKPlaceholderView showPlaceholderViewAddedTo:view];
    placeholderView.titleLabelText = titleLabelText;
//    placeholderView.detailsLabelText = detailsLabelText;
    placeholderView.placeholderImage = KPlaceholderImage;
    placeholderView.placeholderViewTapButtonTitle = @"重新刷新";
    placeholderView.placeholderViewTapButtonTitleFont = [UIFont systemFontOfSize:18];
    placeholderView.placeholderViewTapButtonTitleColor = [UIColor redColor];
//    placeholderView.placeholderViewTapButtonImage = [UIImage imageNamed:@"button_background_foursquare_highlight"];
    placeholderView.placeholderViewTapButtonBgImage = [UIImage imageNamed:@"button_background_foursquare_highlight"];


    placeholderView.placeholderViewTapButtonBlock = tapButtonBlock;
    placeholderView.titleLabelColor = KTitleLabelColor;

    placeholderView.titleLabelFont = [UIFont systemFontOfSize:kTitleFontSize];
    placeholderView.verticalSpace = kVerticalSpace;
    placeholderView.backgroundColor = [UIColor whiteColor];
    //如果当前View 的父视图是滑动视图不让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)view;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = NO;
    }

    [scrollTempView addObserver:self forKeyPath:UKPlaceholderViewKeyPathContentInset options:NSKeyValueObservingOptionNew context:NULL];


}


- (void)hidefailureViewFromView:(UIView *)view
{
    //如果当前View 的父视图是滑动视图移除时候让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)view;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = YES;
    }
    [scrollTempView removeObserver:self forKeyPath:UKPlaceholderViewKeyPathContentInset];
    [UKPlaceholderView hidePlaceholderViewForView:view];
}

- (UKPlaceholderView *)placeholderViewForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:[UKPlaceholderView class]]) {
            return (UKPlaceholderView *)subview;
        }
    }
    return nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    UIScrollView *scrollTempView = (UIScrollView *)object;
    UKPlaceholderView *placeholderView = [self placeholderViewForView:scrollTempView];
    placeholderView.verticalOffset = -scrollTempView.contentInset.top;

}


@end

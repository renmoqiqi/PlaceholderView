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
static const CGFloat kVerticalSpace = 10.f;
//static NSString *const titleLabelText = @"数据加载失败";
//static NSString *const detailsLabelText = @"请在刷新下试试看";
//
//#define KPlaceholderImage [UIImage imageNamed:@"cover"]
//#define KPlaceholderViewTapButtonImage [UIImage imageNamed:@"testImage"]
#define KTitleLabelColor [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1.0]

static NSString *const UKPlaceholderViewKeyPathContentInset = @"contentInset";


#pragma mark

@implementation UIViewController (PlaceholderView)

- (void)showPlaceholderViewTitle:(nullable NSString *)title subTitle:(nullable NSString *)subTitle  tapButtonBgImage:(nullable UIImage *)tapButtonBgImage tapButtonTitle:(nullable NSString *)tapButtonTitle placeholderImage:(nullable UIImage *)placeholderImage inView:(nullable UIView *)view tapButtonBlock:(void(^)(void))tapButtonBlock
{
    UKPlaceholderView *placeholderView = [UKPlaceholderView showPlaceholderViewAddedTo:view];
    placeholderView.titleLabelText = title;
    placeholderView.detailsLabelText = subTitle;
    placeholderView.placeholderImage = placeholderImage;
    placeholderView.placeholderViewTapButtonTitle = tapButtonTitle;
    placeholderView.placeholderViewTapButtonTitleFont = [UIFont systemFontOfSize:kTitleFontSize];
    placeholderView.placeholderViewTapButtonTitleColor = [UIColor whiteColor];
    placeholderView.placeholderViewTapButtonBgImage = tapButtonBgImage;
    placeholderView.placeholderViewTapButtonBlock = tapButtonBlock;
    placeholderView.titleLabelColor = KTitleLabelColor;
    placeholderView.detailsLabelColor = KTitleLabelColor;

    placeholderView.titleLabelFont = [UIFont systemFontOfSize:kTitleFontSize];
    placeholderView.detailsLabelFont = [UIFont systemFontOfSize:kTitleFontSize];

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

- (void)showPlaceholderViewTitle:(nullable NSString *)title subTitle:(nullable NSString *)subTitle  placeholderImage:(nullable UIImage *)placeholderImage inView:(nullable UIView *)view
{
    UKPlaceholderView *placeholderView = [UKPlaceholderView showPlaceholderViewAddedTo:view];
    placeholderView.titleLabelText = title;
    placeholderView.detailsLabelText = subTitle;
    placeholderView.placeholderImage = placeholderImage;
    placeholderView.placeholderViewTapButtonTitleFont = [UIFont systemFontOfSize:kTitleFontSize];
    placeholderView.placeholderViewTapButtonTitleColor = [UIColor whiteColor];
    placeholderView.titleLabelColor = KTitleLabelColor;
    placeholderView.detailsLabelColor = KTitleLabelColor;
    placeholderView.titleLabelFont = [UIFont systemFontOfSize:kTitleFontSize];
    placeholderView.detailsLabelFont = [UIFont systemFontOfSize:kTitleFontSize];

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


- (void)hidePlaceholderViewFromView:(nullable UIView *)view
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

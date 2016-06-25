//
//  UIViewController+PlaceholderView.h
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/22.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PlaceholderView)

/**
 *  功能：在某个View显示加载失败的默认视图
 *
 *  @param view 被添加的View
 *  @param tapBlock 点击button 的block
 */
- (void)showfailureViewInView:(UIView *)view tapButtonBlock:(void(^)(void))tapButtonBlock;

/**
 *  功能：隐藏加载失败的View
 *
 *  @param view 被添加的View
 */
- (void)hidefailureViewFromView:(UIView *)view;


@end

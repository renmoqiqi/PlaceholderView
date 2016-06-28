//
//  UIViewController+PlaceholderView.h
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/22.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIViewController (PlaceholderView)

/**
 *  功能：添加默认视图
 *
 *  @param title            title
 *  @param subTitle         subTitle
 *  @param tapButtonBgImage tapButtonBgImage
 *  @param tapButtonTitle   tapButtonTitle
 *  @param placeholderImage placeholderImage
 *  @param view             被添加的View
 *  @param tapButtonBlock   点击按钮的回调
 */
- (void)showPlaceholderViewTitle:(nullable NSString *)title subTitle:(nullable NSString *)subTitle  tapButtonBgImage:(nullable UIImage *)tapButtonBgImage tapButtonTitle:(nullable NSString *)tapButtonTitle placeholderImage:(nullable UIImage *)placeholderImage inView:(nullable UIView *)view tapButtonBlock:(void(^)(void))tapButtonBlock;

/**
 *  功能：添加默认视图
 *
 *  @param title            title
 *  @param subTitle         subTitle
 *  @param placeholderImage placeholderImage
 *  @param view             被添加的View
 */

- (void)showPlaceholderViewTitle:(nullable NSString *)title subTitle:(nullable NSString *)subTitle  placeholderImage:(nullable UIImage *)placeholderImage inView:(nullable UIView *)view ;

/**
 *  功能：隐藏加载失败的View
 *
 *  @param view 被添加的View
 */
- (void)hidePlaceholderViewFromView:(nullable UIView *)view;



@end

NS_ASSUME_NONNULL_END

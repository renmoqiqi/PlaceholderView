//
//  UKPlaceholderView.h
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/21.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PlaceholderViewTapButtonBlock)(void);

@interface UKPlaceholderView : UIView

//title Text
@property (copy, nonatomic) NSString *titleLabelText;
//detailsTitle Text
@property (copy, nonatomic) NSString *detailsLabelText;
//title font
@property (strong) UIFont *titleLabelFont;
//detailsTitle font
@property (strong, nonatomic) UIFont *detailsLabelFont;
//title Color
@property (strong, nonatomic) UIColor *titleLabelColor;
//detailsTitle Color
@property (strong, nonatomic) UIColor *detailsLabelColor;
//placeholderImage
@property (strong, nonatomic) UIImage *placeholderImage;
//tap Button Image
@property (strong, nonatomic) UIImage *placeholderViewTapButtonImage;
//tap button BgImage
@property (strong, nonatomic) UIImage *placeholderViewTapButtonBgImage;
//tap button title
@property (copy, nonatomic) NSString *placeholderViewTapButtonTitle;
//tap button title font
@property (strong, nonatomic) UIFont *placeholderViewTapButtonTitleFont;
//tap button title color
@property (strong, nonatomic) UIColor *placeholderViewTapButtonTitleColor;

//整体的偏移量
@property (nonatomic, assign) CGFloat verticalOffset;
//元素之前的空白距离
@property (nonatomic, assign) CGFloat verticalSpace;

//点击的tap  button 的block
@property (copy, nonatomic) PlaceholderViewTapButtonBlock placeholderViewTapButtonBlock;

//添加默认视图到某个View
+(UKPlaceholderView *)showPlaceholderViewAddedTo:(UIView *)view;
//隐藏默认视图
+ (UKPlaceholderView *)hidePlaceholderViewForView:(UIView *)view;

@end

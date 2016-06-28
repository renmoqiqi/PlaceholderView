# PlaceholderView
在任何视图上添加默认视图

# 用法
```

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
- (void)showPlaceholderViewTitle:(nullable NSString *)title
                        subTitle:(nullable NSString *)subTitle
                tapButtonBgImage:(nullable UIImage *)tapButtonBgImage
                  tapButtonTitle:(nullable NSString *)tapButtonTitle
                placeholderImage:(nullable UIImage *)placeholderImage
                          inView:(nullable UIView *)view
                  tapButtonBlock:(void(^)(void))tapButtonBlock;

/**
 *  功能：添加默认视图
 *
 *  @param title            title
 *  @param subTitle         subTitle
 *  @param placeholderImage placeholderImage
 *  @param view             被添加的View
 */

- (void)showPlaceholderViewTitle:(nullable NSString *)title
                        subTitle:(nullable NSString *)subTitle
                placeholderImage:(nullable UIImage *)placeholderImage
                          inView:(nullable UIView *)view;

/**
 *  功能：隐藏加载失败的View
 *
 *  @param view 被添加的View
 */
- (void)hidePlaceholderViewFromView:(nullable UIView *)view;

```
    
# 效果图
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/1.png) 
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/2.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/3.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/4.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/5.png)  

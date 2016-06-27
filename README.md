# PlaceholderView
在任何视图上添加默认视图

# 用法
```
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
    
# 效果图
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/1.png) 
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/2.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/3.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/4.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/5.png)  

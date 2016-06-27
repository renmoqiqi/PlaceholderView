# PlaceholderView
在任何视图上添加默认视图

# 用法
```

static const CGFloat kTitleFontSize = 16.f;
static const CGFloat kVerticalSpace = 15.f;
static NSString *const titleLabelText = @"数据加载失败";
static NSString *const detailsLabelText = @"请在刷新下试试看";

#define KPlaceholderImage [UIImage imageNamed:@"cover"]
#define KPlaceholderViewTapButtonImage [UIImage imageNamed:@"testImage"]
#define KTitleLabelColor [UIColor colorWithRed:86/255.0 green:86/255.0 blue:86/255.0 alpha:1.0]

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

    //如果当前View 的父视图是滑动视图不让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)view;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = NO;
    }


    if (self.automaticallyAdjustsScrollViewInsets == NO ) {

        placeholderView.verticalOffset = 0;

    }
    else
    {
        if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
        {
            placeholderView.verticalOffset = -64;

        }
        else
        {
            placeholderView.verticalOffset = 0;

        }


    }


}

- (void)hidefailureViewFromView:(UIView *)view
{
    //如果当前View 的父视图是滑动视图移除时候让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)view;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = YES;
    }
    [UKPlaceholderView hidePlaceholderViewForView:view];
}

```
# Controller 类别方便使用
    [self showfailureViewInView:self.tableView tapButtonBlock:^{

        [self hidefailureViewFromView:self.tableView];
    }];
    
# 效果图
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/1.png) 
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/2.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/3.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/4.png)  
![](https://github.com/renmoqiqi/PlaceholderView/blob/master/PlaceholdViewDemo/Resource/5.png)  

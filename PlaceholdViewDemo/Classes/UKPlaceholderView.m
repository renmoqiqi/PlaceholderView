//
//  UKPlaceholderView.m
//  PlaceholdViewDemo
//
//  Created by penghe on 16/6/21.
//  Copyright © 2016年 penghe. All rights reserved.
//

#import "UKPlaceholderView.h"


#pragma mark


@interface UIView (DZNConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

@end

#pragma mark - UIView+DZNConstraintBasedLayoutExtensions

@implementation UIView (DZNConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}
@end

#pragma mark Constants Define

static const CGFloat kTitleFontSize = 14.f;
static const CGFloat kDetailsLabelFontSize = 16.f;
static const CGFloat KVerticalOffset = 5.0f;
static const CGFloat KVerticalSpace = 5.0f;


#pragma mark

@interface UKPlaceholderView ()

@property (nonatomic, readonly) UIView *contentView;
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *detailLabel;
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, strong) UIView *customView;

@property (nonatomic, assign) BOOL fadeInOnDisplay;

@end
@implementation UKPlaceholderView
@synthesize contentView = _contentView;
@synthesize titleLabel = _titleLabel, detailLabel = _detailLabel, imageView = _imageView, button = _button;

#pragma mark - Initialization Methods

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentView];

        [self setupUIInit];
        [self registerForKVO];

    }
    return self;
}

- (instancetype)initWithView:(UIView *)view {
    NSAssert(view, @"View must not be nil.");

    return [self initWithFrame:view.bounds];
}

- (void)dealloc
{
    [self unregisterFromKVO];
}

- (void)didMoveToSuperview
{
    self.frame = self.superview.bounds;

    void(^fadeInBlock)(void) = ^{_contentView.alpha = 1.0;};

    if (self.fadeInOnDisplay) {
        [UIView animateWithDuration:0.25
                         animations:fadeInBlock
                         completion:NULL];
    }
    else {
        fadeInBlock();
    }

}

#pragma mark - Setup

- (void)setupUIInit
{
    self.titleLabelText = nil;
    self.detailsLabelText = nil;
    self.titleLabelColor = nil;
    self.detailsLabelColor = nil;
    self.titleLabelFont = [UIFont systemFontOfSize:kTitleFontSize];
    self.detailsLabelFont = [UIFont systemFontOfSize:kDetailsLabelFontSize];
    self.verticalOffset = KVerticalOffset;
    self.verticalSpace = KVerticalSpace;

    self.placeholderImage = nil;
    self.placeholderViewTapButtonImage = nil;
    self.placeholderViewTapButtonBgImage = nil;
    self.placeholderViewTapButtonTitle = nil;
    self.placeholderViewTapButtonTitleFont = nil;
    self.placeholderViewTapButtonTitleColor = nil;

    self.titleLabel.text = self.titleLabelText;

    self.detailLabel.text = self.detailsLabelText;

    self.titleLabel.font = self.titleLabelFont;


    self.detailLabel.font = self.detailsLabelFont;
    [self.button setTitleColor:self.placeholderViewTapButtonTitleColor forState:UIControlStateNormal];
    [self.button setTitle:self.placeholderViewTapButtonTitle forState:UIControlStateNormal];
    [self.button.titleLabel setFont:self.placeholderViewTapButtonTitleFont];
    [self.button setBackgroundImage:self.placeholderViewTapButtonBgImage forState:UIControlStateNormal];
    [self.button setImage:self.placeholderViewTapButtonImage forState:UIControlStateNormal];



}

#pragma mark - KVO

- (void)registerForKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)unregisterFromKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)observableKeypaths {
    return [NSArray arrayWithObjects:@"titleLabelText", @"detailsLabelText", @"titleLabelFont", @"detailsLabelFont", @"titleLabelColor",
            @"detailsLabelColor", @"placeholderImage", @"placeholderViewTapButtonImage", @"verticalOffset", @"verticalSpace", @"placeholderViewTapButtonBgImage",@"placeholderViewTapButtonTitle",@"placeholderViewTapButtonTitleFont",@"placeholderViewTapButtonTitleColor",nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(updateUIForKeypath:) withObject:keyPath waitUntilDone:NO];
    } else {
        [self updateUIForKeypath:keyPath];
    }
}

- (void)updateUIForKeypath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"titleLabelText"]) {
        self.titleLabel.text = self.titleLabelText;
    } else if ([keyPath isEqualToString:@"detailsLabelText"]) {
        self.detailLabel.text = self.detailsLabelText;
    } else if ([keyPath isEqualToString:@"titleLabelFont"]) {
        self.titleLabel.font = self.titleLabelFont;
    } else if ([keyPath isEqualToString:@"detailsLabelFont"]) {
        self.detailLabel.font = self.detailsLabelFont;
    } else if ([keyPath isEqualToString:@"titleLabelColor"]) {
        self.titleLabel.textColor = self.titleLabelColor;
    } else if ([keyPath isEqualToString:@"detailsLabelColor"]) {
        self.detailLabel.textColor = self.detailsLabelColor;
    } else if ([keyPath isEqualToString:@"placeholderImage"]) {
        self.imageView.image = self.placeholderImage;
    } else if ([keyPath isEqualToString:@"placeholderViewTapButtonImage"]) {
        [self.button setImage:self.placeholderViewTapButtonImage forState:UIControlStateNormal];
    }else if ([keyPath isEqualToString:@"verticalOffset"]) {

    }else if ([keyPath isEqualToString:@"verticalSpace"]) {
    }else if ([keyPath isEqualToString:@"placeholderViewTapButtonBgImage"]){

        //拉伸范围
        UIEdgeInsets capInsets = UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0);
       UIImage *tempImge = [self.placeholderViewTapButtonBgImage resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] ;
        [self.button setBackgroundImage:tempImge forState:UIControlStateNormal];


    }else if ([keyPath isEqualToString:@"placeholderViewTapButtonTitle"]){
        [self.button setTitle:self.placeholderViewTapButtonTitle forState:UIControlStateNormal];
    }
    else if ([keyPath isEqualToString:@"placeholderViewTapButtonTitleFont"]){
        self.button.titleLabel.font = self.placeholderViewTapButtonTitleFont;

    }else if ([keyPath isEqualToString:@"placeholderViewTapButtonTitleColor"]){
        [self.button setTitleColor:self.placeholderViewTapButtonTitleColor forState:UIControlStateNormal];
    }
    
    [self setNeedsUpdateConstraints];
}


#pragma mark - Getters

- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [UIView new];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.backgroundColor = [UIColor clearColor];
        _contentView.userInteractionEnabled = YES;
        _contentView.alpha = 0;
    }
    return _contentView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = NO;
        _imageView.accessibilityIdentifier = @"empty set background image";

        [_contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];

        _titleLabel.font = [UIFont systemFontOfSize:27.0];
        _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        _titleLabel.accessibilityIdentifier = @"empty set title";

        [_contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [UILabel new];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLabel.backgroundColor = [UIColor clearColor];

        _detailLabel.font = [UIFont systemFontOfSize:17.0];
        _detailLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _detailLabel.numberOfLines = 0;
        _detailLabel.accessibilityIdentifier = @"empty set detail label";

        [_contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _button.accessibilityIdentifier = @"empty set button";

        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];

        [_contentView addSubview:_button];
    }
    return _button;
}

- (BOOL)canShowImage
{
    return (_imageView.image && _imageView.superview);
}

- (BOOL)canShowTitle
{
    return (_titleLabel.text.length > 0 && _titleLabel.superview);
}

- (BOOL)canShowDetail
{
    return (_detailLabel.text.length > 0 && _detailLabel.superview);
}

- (BOOL)canShowButton
{
    if (_button.titleLabel.text.length > 0 || [_button imageForState:UIControlStateNormal]) {
        return (_button.superview != nil) ? YES : NO;
    }
    return NO;
}


#pragma mark - Setters

- (void)setCustomView:(UIView *)view
{
    if (!view) {
        return;
    }

    if (_customView) {
        [_customView removeFromSuperview];
        _customView = nil;
    }

    _customView = view;
    _customView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_customView];
}

#pragma mark - Auto-Layout Configuration

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, self.superview.bounds.size.width, self.superview.bounds.size.height);

}

- (void)updateConstraints
{

    // First, configure the content view constaints
    // The content view must alway be centered to its superview
    NSLayoutConstraint *centerXConstraint = [self equallyRelatedConstraintWithView:self.contentView attribute:NSLayoutAttributeCenterX];
    NSLayoutConstraint *centerYConstraint = [self equallyRelatedConstraintWithView:self.contentView attribute:NSLayoutAttributeCenterY];

    [self addConstraint:centerXConstraint];
    [self addConstraint:centerYConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:nil views:@{@"contentView": self.contentView}]];

    // When a custom offset is available, we adjust the vertical constraints' constants
    if (self.verticalOffset != 0 && self.constraints.count > 0) {
        centerYConstraint.constant = self.verticalOffset;
    }

    // If applicable, set the custom view's constraints
    if (_customView) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:@{@"contentView": self.contentView}]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customView]|" options:0 metrics:nil views:@{@"customView":_customView}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customView]|" options:0 metrics:nil views:@{@"customView":_customView}]];
    }
    else {
        CGFloat width = CGRectGetWidth(self.frame) ? : CGRectGetWidth([UIScreen mainScreen].bounds);
        CGFloat padding = roundf(width/16.0);
        CGFloat verticalSpace = self.verticalSpace ? : 11.0; // Default is 11 pts

        NSMutableArray *subviewStrings = [NSMutableArray array];
        NSMutableDictionary *views = [NSMutableDictionary dictionary];
        NSDictionary *metrics = @{@"padding": @(padding)};

        // Assign the image view's horizontal constraints
        if (_imageView.superview) {

            [subviewStrings addObject:@"imageView"];
            views[[subviewStrings lastObject]] = _imageView;

            [self.contentView addConstraint:[self.contentView equallyRelatedConstraintWithView:_imageView attribute:NSLayoutAttributeCenterX]];
        }

        // Assign the title label's horizontal constraints
        if ([self canShowTitle]) {

            [subviewStrings addObject:@"titleLabel"];
            views[[subviewStrings lastObject]] = _titleLabel;

            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[titleLabel(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
        }
        // or removes from its superview
        else {
            [_titleLabel removeFromSuperview];
            _titleLabel = nil;
        }

        // Assign the detail label's horizontal constraints
        if ([self canShowDetail]) {

            [subviewStrings addObject:@"detailLabel"];
            views[[subviewStrings lastObject]] = _detailLabel;

            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[detailLabel(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
        }
        // or removes from its superview
        else {
            [_detailLabel removeFromSuperview];
            _detailLabel = nil;
        }

        // Assign the button's horizontal constraints
        if ([self
             canShowButton]) {
            [subviewStrings addObject:@"button"];
            views[[subviewStrings lastObject]] = _button;

            //当前宽度
            CGFloat width = CGRectGetWidth(self.frame) ? : CGRectGetWidth([UIScreen mainScreen].bounds);
            //当前button title size
            CGSize titleSize = [_button.currentTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:_button.titleLabel.font.fontName size:_button.titleLabel.font.pointSize]}];

            //默认在button文字计算出来的宽度留出来10
            CGFloat buttonPadding = (width - titleSize.width)/2 - 10;

           //给button特别设置metrics
            NSDictionary *buttonMetrics = @{@"buttonPadding": @(buttonPadding)};

            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonPadding@750)-[button(>=0)]-(buttonPadding@750)-|"
                                                                                     options:0 metrics:buttonMetrics views:views]];

        }
        // or removes from its superview
        else {
            [_button removeFromSuperview];
            _button = nil;
        }


        NSMutableString *verticalFormat = [NSMutableString new];

        // Build a dynamic string format for the vertical constraints, adding a margin between each element. Default is 11 pts.
        for (int i = 0; i < subviewStrings.count; i++) {

            NSString *string = subviewStrings[i];
            [verticalFormat appendFormat:@"[%@]", string];

            if (i < subviewStrings.count-1) {
                [verticalFormat appendFormat:@"-(%.f@750)-", verticalSpace];
            }
        }

        // Assign the vertical constraints to the content view
        if (verticalFormat.length > 0) {
            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|%@|", verticalFormat]
                                                                                     options:0 metrics:metrics views:views]];
        }
    }
    [super updateConstraints];

}



//事件传递到下面
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *hitView = [super hitTest:point withEvent:event];
//
//    // Return any UIControl instance such as buttons, segmented controls, switches, etc.
//    if ([hitView isKindOfClass:[UIControl class]]) {
//        return hitView;
//    }
//
//    // Return either the contentView or customView
//    if ([hitView isEqual:_contentView] || [hitView isEqual:_customView]) {
//        return hitView;
//    }
//
//    return nil;
//}

#pragma mark - Actions

- (void)didTapButton:(id)sender
{
    if (self.placeholderViewTapButtonBlock) {
        self.placeholderViewTapButtonBlock();
    }
}

+(UKPlaceholderView*)showPlaceholderViewAddedTo:(UIView *)view
{
    UKPlaceholderView *placeholderView = [self placeholderViewForView:view];

    placeholderView.userInteractionEnabled = NO;
    if (placeholderView != nil) {
        [placeholderView removeFromSuperview];
    }
    placeholderView = [[self alloc] initWithView:view];
    [view addSubview:placeholderView];

    //如果当前View 的父视图是滑动视图不让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)placeholderView.superview;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = NO;
    }
    return placeholderView;
}

+ (UKPlaceholderView *)hidePlaceholderViewForView:(UIView *)view
{
    UKPlaceholderView *placeholderView = [self placeholderViewForView:view];

    //如果当前View 的父视图是滑动视图移除时候让其滑动
    UIScrollView *scrollTempView = (UIScrollView *)placeholderView.superview;
    if ([view isKindOfClass:[UIScrollView class]] || [view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]])
    {
        scrollTempView.scrollEnabled = YES;
    }

    if (placeholderView != nil) {
        [placeholderView removeFromSuperview];
    }
    return placeholderView;
}

+ (instancetype)placeholderViewForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (UKPlaceholderView *)subview;
        }
    }
    return nil;
}

@end

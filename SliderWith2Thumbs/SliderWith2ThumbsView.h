//
//  SliderWith2ThumbsView.h
//  SliderWith2Thumbs
//
//  Created by Yuki Tomiyoshi on 2013/12/27.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderWith2ThumbsView : UIView

@property (nonatomic, retain) UILabel *settingValueLabel;
@property (nonatomic, retain) UIImageView *minThumbImageView;
@property (nonatomic, retain) UIImageView *maxThumbImageView;
@property (nonatomic, retain) UIImageView *highLightBarImageView;
@property (nonatomic, retain) UIImageView *noHighLightBarImageView;

- (float)getMargin;

@end

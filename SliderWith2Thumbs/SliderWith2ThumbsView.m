//
//  SliderWith2ThumbsView.m
//  SliderWith2Thumbs
//
//  Created by Yuki Tomiyoshi on 2013/12/27.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import "SliderWith2ThumbsView.h"
#import "SliderWith2ThumbsViewController.h"

const float topMargin = 100.0f;
const float margin = 30.0f;
const float sliderHeight = 5.0f;

@implementation SliderWith2ThumbsView

@synthesize settingValueLabel = _settingValueLabel;
@synthesize minThumbImageView = _minThumbImageView;
@synthesize maxThumbImageView = _maxThumbImageView;
@synthesize highLightBarImageView = _highLightBarImageView;
@synthesize noHighLightBarImageView = _noHighLightBarImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UILabel*)settingValueLabel {
    
    if(!_settingValueLabel){
        _settingValueLabel = [[UILabel alloc] init];
        _settingValueLabel.frame =  CGRectMake(margin,
                                               topMargin / 2,
                                               self.frame.size.width,
                                               30);
        [self addSubview:_settingValueLabel];
    }
    return _settingValueLabel;
}

- (UIImageView*)noHighLightBarImageView {
    
    if(!_noHighLightBarImageView) {
        _noHighLightBarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"graybar.png"]];
        _noHighLightBarImageView.frame = CGRectMake(margin,
                                                    topMargin,
                                                    self.frame.size.width - margin * 2,
                                                    sliderHeight);
        [self addSubview:_noHighLightBarImageView];
    }
    return _noHighLightBarImageView;
}

- (UIImageView*)highLightBarImageView {
    if(!_highLightBarImageView) {
        _highLightBarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluebar.png"]];
        _highLightBarImageView.frame = CGRectMake(margin + _noHighLightBarImageView.frame.size.width / 3,
                                                  topMargin,
                                                  _noHighLightBarImageView.frame.size.width / 3 * 1,
                                                  sliderHeight);
        [self addSubview:_highLightBarImageView];
    }
    return _highLightBarImageView;    
}

- (UIImageView*)minThumbImageView {
    if(!_minThumbImageView) {
        _minThumbImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb.png"]];
        _minThumbImageView.frame = CGRectMake(0,
                                              0,
                                              sliderHeight * 4,
                                              sliderHeight * 4);
        _minThumbImageView.contentMode = UIViewContentModeScaleAspectFit;
        _minThumbImageView.center = CGPointMake(margin + _noHighLightBarImageView.frame.size.width / 3,
                                                topMargin + sliderHeight / 2);
        [self addSubview:_minThumbImageView];
    }
    return _minThumbImageView;
    
}

- (UIImageView*)maxThumbImageView {
    if(!_maxThumbImageView) {
        _maxThumbImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb.png"]];
        _maxThumbImageView.frame = CGRectMake(0,
                                              0,
                                              sliderHeight * 4,
                                              sliderHeight * 4);
        _maxThumbImageView.contentMode = UIViewContentModeScaleAspectFit;
        _maxThumbImageView.center = CGPointMake(margin + _noHighLightBarImageView.frame.size.width / 3 * 2,
                                                topMargin + sliderHeight / 2);
        [self addSubview:_maxThumbImageView];
    }
    return _maxThumbImageView;
    
}

- (float)getMargin {
    return margin;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

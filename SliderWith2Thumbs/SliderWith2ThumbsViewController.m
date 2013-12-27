//
//  SliderWith2ThumbsViewController.m
//  SliderWith2Thumbs
//
//  Created by Yuki Tomiyoshi on 2013/12/27.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import "SliderWith2ThumbsViewController.h"

const int minimumValue = 5;
const int maximumValue = 35;
const int minimumRange = 1;

@interface SliderWith2ThumbsViewController ()

@end

@implementation SliderWith2ThumbsViewController

@synthesize sliderView = _sliderView;
@synthesize selectedMinimumValue = _selectedMinimumValue;
@synthesize selectedMaximumValue = _selectedMaximumValue;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    _selectedMinimumValue = (maximumValue - minimumValue) / 3 + minimumValue;
    _selectedMaximumValue = (maximumValue - minimumValue) / 3 * 2 + minimumValue;
    
    _sliderView = [[SliderWith2ThumbsView alloc] initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          self.view.frame.size.width,
                                                                          self.view.frame.size.height)];
    _sliderView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_sliderView];
    
    [_sliderView settingValueLabel];
    
    [_sliderView noHighLightBarImageView];
    
    [_sliderView highLightBarImageView];
    
    [_sliderView minThumbImageView];
    _sliderView.minThumbImageView.userInteractionEnabled = YES;
    _sliderView.minThumbImageView.exclusiveTouch = YES;
    _sliderView.minThumbImageView.tag = 100;
    
    [_sliderView maxThumbImageView];
    _sliderView.maxThumbImageView.userInteractionEnabled = YES;
    _sliderView.maxThumbImageView.exclusiveTouch = YES;
    _sliderView.maxThumbImageView.tag = 101;
    
    _sliderView.settingValueLabel.text =
    [NSString stringWithFormat:@"%d〜%d", _selectedMinimumValue, _selectedMaximumValue];
    
    [_sliderView addSubview:_sliderView.settingValueLabel];
    [_sliderView addSubview:_sliderView.noHighLightBarImageView];
    [_sliderView addSubview:_sliderView.highLightBarImageView];
    [_sliderView addSubview:_sliderView.minThumbImageView];
    [_sliderView addSubview:_sliderView.maxThumbImageView];
        
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    float x = [touch locationInView:_sliderView].x;
    if (x > _sliderView.noHighLightBarImageView.frame.size.width + [_sliderView getMargin]) {
        x = _sliderView.noHighLightBarImageView.frame.size.width + [_sliderView getMargin];
    } else if (x < [_sliderView getMargin]) {
        x = [_sliderView getMargin];
    }
    
    switch (touch.view.tag) {
        case 100:
            
            if( ((_selectedMaximumValue - [self getMinimumValue:x]) >= minimumRange) && ([self getMinimumValue:x] >= minimumValue) ) {
                [self getMinimumValue:x];
                _sliderView.settingValueLabel.text =
                [NSString stringWithFormat:@"%d〜%d", _selectedMinimumValue, _selectedMaximumValue];
                touch.view.center = CGPointMake([_sliderView getMargin] + _sliderView.noHighLightBarImageView.frame.size.width / (maximumValue - minimumValue) * (_selectedMinimumValue - minimumValue), touch.view.center.y);
                _sliderView.highLightBarImageView.frame = CGRectMake(touch.view.center.x,
                                                                     _sliderView.highLightBarImageView.frame.origin.y,
                                                                     _sliderView.maxThumbImageView.center.x - touch.view.center.x,
                                                                     _sliderView.highLightBarImageView.frame.size.height);
                [_sliderView bringSubviewToFront:touch.view];
            }
            break;
            
        case 101:
            
            if( (([self getMaximumValue:x] - _selectedMinimumValue) >= minimumRange) && ([self getMaximumValue:x] <= maximumValue) ) {
                [self getMaximumValue:x];
                _sliderView.settingValueLabel.text =
                [NSString stringWithFormat:@"%d〜%d", _selectedMinimumValue, _selectedMaximumValue];
                touch.view.center = CGPointMake([_sliderView getMargin] + _sliderView.noHighLightBarImageView.frame.size.width / (maximumValue - minimumValue) * (_selectedMaximumValue - minimumValue), touch.view.center.y);
                _sliderView.highLightBarImageView.frame = CGRectMake(_sliderView.minThumbImageView.center.x,
                                                                     _sliderView.highLightBarImageView.frame.origin.y,
                                                                     touch.view.center.x - _sliderView.minThumbImageView.center.x,
                                                                     _sliderView.highLightBarImageView.frame.size.height);
                [_sliderView bringSubviewToFront:touch.view];
            }
            break;
            
        default:
            break;
    }
}

- (int)getMinimumValue:(float)x {
    float margin = [_sliderView getMargin];
    float barWidth = _sliderView.noHighLightBarImageView.frame.size.width;
   
    float rate = (x - margin) / barWidth;
    
    _selectedMinimumValue = (maximumValue - minimumValue) * rate * 10;
    
    if (_selectedMinimumValue % 10 < 5) {
        _selectedMinimumValue = _selectedMinimumValue / 10 + minimumValue;
    } else {
        _selectedMinimumValue = (_selectedMinimumValue + 10) / 10 + minimumValue;
    }
    
    return  _selectedMinimumValue;
    
}

- (int)getMaximumValue:(float)x {
    float margin = [_sliderView getMargin];
    float barWidth = _sliderView.noHighLightBarImageView.frame.size.width;

    float rate = (x - margin) / barWidth;
    
    _selectedMaximumValue = (maximumValue - minimumValue) * rate * 10;
    
    if (_selectedMaximumValue % 10 < 5) {
        _selectedMaximumValue = _selectedMaximumValue / 10 + minimumValue;
    } else {
        _selectedMaximumValue = (_selectedMaximumValue + 10) / 10 + minimumValue;
    }
    
    return _selectedMaximumValue;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

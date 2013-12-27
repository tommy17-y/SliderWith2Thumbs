//
//  SliderWith2ThumbsViewController.h
//  SliderWith2Thumbs
//
//  Created by Yuki Tomiyoshi on 2013/12/27.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderWith2ThumbsView.h"

@interface SliderWith2ThumbsViewController : UIViewController

@property SliderWith2ThumbsView *sliderView;

@property int selectedMinimumValue;
@property int selectedMaximumValue;

@end

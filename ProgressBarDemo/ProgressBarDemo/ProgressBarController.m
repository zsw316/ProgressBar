//
//  ProgressBarController.m
//  LearningPlatform
//
//  Created by Shaowei Zhang on 19/2/2017.
//  Copyright © 2017 SWZ. All rights reserved.
//

#import "ProgressBarController.h"
#import "ProgressBar.h"

@interface ProgressBarController ()
{
    ProgressBar *_progressBar;
    UILabel *_progressLabel;
    UISlider *_slider;
}

@end

@implementation ProgressBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Progress Bar";
    self.view.backgroundColor = [UIColor grayColor];
    
    CGFloat startX = (CGRectGetWidth(self.view.bounds) - 280) / 2;
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(startX, 80, 280, 40)];
    _slider.minimumValue = 1;
    _slider.maximumValue = 100;
    _slider.value = 72;
    
    [_slider addTarget:self action:@selector(updateSliderValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    _progressBar = [[ProgressBar alloc] initWithFrame:CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200) total:@100.f current:@(_slider.value) clockwise:YES];
    _progressBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_progressBar];
    
    _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 15, 100, 30)];
    _progressLabel.textColor = [UIColor whiteColor];
    _progressLabel.textAlignment = NSTextAlignmentCenter;
    _progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)_slider.value];
    [self.view addSubview:_progressLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSliderValue:(UISlider *)slider {
    _progressBar.current = @(_slider.value);
    _progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)_slider.value];
    [_progressBar setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

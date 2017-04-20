//
//  LPProgressBar.h
//  LearningPlatform
//
//  Created by Shaowei Zhang on 19/2/2017.
//  Copyright © 2017 SWZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        total:(NSNumber *)total
                      current:(NSNumber *)current
                    clockwise:(BOOL)clockwise;

@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *current;
@property (nonatomic, assign) BOOL clockwise;

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) NSNumber *lineWidth;

@end

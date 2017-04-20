//
//  LPProgressBar.m
//  LearningPlatform
//
//  Created by Shaowei Zhang on 19/2/2017.
//  Copyright © 2017 SWZ. All rights reserved.
//

#import "ProgressBar.h"

@implementation ProgressBar

- (instancetype)initWithFrame:(CGRect)frame
                        total:(NSNumber *)total
                      current:(NSNumber *)current
                    clockwise:(BOOL)clockwise {
    self = [super initWithFrame:frame];
    if (self) {
        _total = total;
        _current = current;
        _clockwise = clockwise;
        _strokeColor = [UIColor orangeColor];
        _lineWidth = @8.0;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (_total <= 0) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat startAngle = 270.f;
    CGFloat angleOffset = 360.0 * ( [_current floatValue] / [_total floatValue] );
    CGFloat curEndAngle = _clockwise ? startAngle + angleOffset : startAngle - angleOffset;
    
    CGFloat centerX = CGRectGetWidth(self.frame) / 2.0f;
    CGFloat centerY = CGRectGetHeight(self.frame) / 2.0f;
    CGFloat radius = centerX < centerY ? centerX : centerY;
    radius -= ([_lineWidth floatValue]/2.0f);
    CGContextAddArc(context, centerX, centerY, radius, startAngle * M_PI / 180, curEndAngle * M_PI / 180.0, _clockwise ? 0: 1);
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetLineWidth(context, [_lineWidth floatValue]);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, _strokeColor.CGColor);
    
    CGContextStrokePath(context);
}


@end

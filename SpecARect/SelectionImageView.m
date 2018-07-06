//
//  SelectionImageView.m
//  SpecARect
//
//  Created by Isaac Schmidt on 7/6/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import "SelectionImageView.h"

@implementation SelectionImageView

    
- (void)mouseDown:(NSEvent *)theEvent
{
    if (self.hasSelection) {
        
        [self resetSelection];
    }
    
        self.startPoint = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        
        // create and configure shape layer
        
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.lineWidth = 1.0;
        self.shapeLayer.strokeColor = [[NSColor blackColor] CGColor];
        self.shapeLayer.fillColor = [[NSColor clearColor] CGColor];
        self.shapeLayer.lineDashPattern = @[@10, @5];
        [self.layer addSublayer:self.shapeLayer];
        
        // create animation for the layer
        
        CABasicAnimation *dashAnimation;
        dashAnimation = [CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
        [dashAnimation setFromValue:@0.0f];
        [dashAnimation setToValue:@15.0f];
        [dashAnimation setDuration:0.75f];
        [dashAnimation setRepeatCount:HUGE_VALF];
        [self.shapeLayer addAnimation:dashAnimation forKey:@"linePhase"];
}
    
- (void)mouseDragged:(NSEvent *)theEvent
{
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        // create path for the shape layer
    
        NSPoint startPoint = self.startPoint;
    
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
        CGPathAddLineToPoint(path, NULL, startPoint.x, point.y);
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
        CGPathAddLineToPoint(path, NULL, point.x, startPoint.y);
        CGPathCloseSubpath(path);
        
        // set the shape layer's path
        self.shapeLayer.path = path;
        CGPathRelease(path);
    
    CGFloat height = (point.y  - startPoint.y);
    CGFloat width = (point.x - startPoint.x);
    
    CGRect selection = CGRectMake(self.startPoint.x, self.startPoint.y, width, height);
    self.selectionFrame = selection;
    self.hasSelection = YES;
    
}
    
- (void)mouseUp:(NSEvent *)theEvent
{
    
}

- (void)resetSelection {
    
    [self.shapeLayer removeFromSuperlayer];
    self.shapeLayer = nil;
    self.selectionFrame = CGRectZero;
    self.hasSelection = NO;
}

@end

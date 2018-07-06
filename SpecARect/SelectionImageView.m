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
    if (!_hasImageForSelection) {
        return;
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
    if (!_hasImageForSelection) {
        return;
    }
    
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        // create path for the shape layer
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, self.startPoint.x, self.startPoint.y);
        CGPathAddLineToPoint(path, NULL, self.startPoint.x, point.y);
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
        CGPathAddLineToPoint(path, NULL, point.x, self.startPoint.y);
        CGPathCloseSubpath(path);
        
        // set the shape layer's path
        
        self.shapeLayer.path = path;
        
        CGPathRelease(path);
}
    
- (void)mouseUp:(NSEvent *)theEvent
{
    if (!_hasImageForSelection) {
        return;
    }
        [self.shapeLayer removeFromSuperlayer];
        self.shapeLayer = nil;
}

@end

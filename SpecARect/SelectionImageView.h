//
//  SelectionImageView.h
//  SpecARect
//
//  Created by Isaac Schmidt on 7/6/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@import QuartzCore;

@interface SelectionImageView : NSImageView
    
@property (nonatomic, assign) NSPoint startPoint;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) BOOL hasSelection;
@property (nonatomic, assign) CGRect selectionFrame;

@end


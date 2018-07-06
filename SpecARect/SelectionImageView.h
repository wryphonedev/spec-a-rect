//
//  SelectionImageView.h
//  SpecARect
//
//  Created by Isaac Schmidt on 7/6/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@import QuartzCore;

@protocol SelectionImageViewProtocol <NSObject>

- (void)didMakeSelection:(CGRect)selectionFrame;
- (void)didClearSelection;

@end

@interface SelectionImageView : NSImageView
    
@property (nonatomic, assign) NSPoint startPoint;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) BOOL hasSelection;
@property (nonatomic, assign) CGRect selectionFrame;
@property (nonatomic, weak) IBOutlet id<SelectionImageViewProtocol> selectionDelegate;

@end


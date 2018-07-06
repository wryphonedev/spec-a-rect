//
//  ViewController.h
//  SpecARect
//
//  Created by Schmidt, Isaac on 7/5/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (nonatomic, nullable, weak) IBOutlet NSButton *fileOpenButton;
@property (nonatomic, nullable, weak) IBOutlet NSButton *appendCoordinateDataButton;
@property (nonatomic, nullable, weak) IBOutlet NSImageView *imageView;
@property (nonatomic, nullable, weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (nonatomic, nullable, strong) NSArray *sourceImageURLs;
@property (nonatomic, nullable, strong) NSMutableArray *completedImageURLs;
@property (nonatomic, nullable, strong) NSMutableArray *completedFrames;
@property (nonatomic, assign) NSInteger currentSelectedIndex;

@end


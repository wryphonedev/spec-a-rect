//
//  ViewController.h
//  SpecARect
//
//  Created by Schmidt, Isaac on 7/5/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SelectionImageView.h"

@class TrainedImage;

@interface ViewController : NSViewController <SelectionImageViewProtocol>

@property (nonatomic, nullable, weak) IBOutlet NSButton *fileOpenButton;
@property (nonatomic, nullable, weak) IBOutlet NSButton *nextButton;
@property (nonatomic, nullable, weak) IBOutlet NSImageView *imageView;
@property (nonatomic, nullable, weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (nonatomic, nullable, strong) NSArray *sourceImageURLs;
@property (nonatomic, nullable, strong) NSMutableArray<TrainedImage *> *trained;
@property (nonatomic, assign) NSInteger currentSelectedIndex;
@property (weak) IBOutlet NSTextField *statusLabel;

@end


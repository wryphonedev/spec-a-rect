//
//  ViewController.m
//  SpecARect
//
//  Created by Schmidt, Isaac on 7/5/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import "ViewController.h"
#import "TrainedImage.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setCurrentSelectedIndex:0];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)didPressOpenFileButton:(id)sender {
    
    NSOpenPanel *panel  = [NSOpenPanel openPanel];
    [panel setAllowsMultipleSelection:YES];
    [panel setCanChooseDirectories:YES];
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse result) {
       [self setSourceImageURLs:[panel URLs]];
        if ([[self sourceImageURLs] count]) {
            [self beginImageMarkup];
        }
    }];
}

- (void)beginImageMarkup {
    
    [self renderNextImage];
    
    
    
}
    
- (void)renderNextImage {
    
    NSInteger nextIndex = self.currentSelectedIndex;
    if (nextIndex <= [[self sourceImageURLs] count]) {
        NSURL *imageURL = [[self sourceImageURLs] objectAtIndex:nextIndex];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
        NSImage *image = [[NSImage alloc] initWithData:imageData];
        [[self imageView] setImage:image];
    }
}

- (void)updateDescriptionTextWithFrame:(CGRect)frame {
    
    NSString *description = NSStringFromRect(frame);
    
    
}

- (void)saveFrameSelection:(CGRect)rect {
    
    NSURL *file = [[self sourceImageURLs] objectAtIndex:(self.currentSelectedIndex - 1)];
    NSString *fileName = [file lastPathComponent];
    NSValue *frameValue = [NSValue valueWithRect:rect];
    
    NSDictionary *frameDict = @{@"imageFrame" : frameValue, @"imageFileName" : fileName};
    NSError *error;
    TrainedImage *image = [[TrainedImage alloc] initWithDictionary:frameDict error:&error];
    [[self ]]
    
}

#pragma mark - Selection Delegate

- (void)didMakeSelection:(CGRect)selectionFrame {
    
    
    
}

- (void)didClearSelection {
    
    
}

@end

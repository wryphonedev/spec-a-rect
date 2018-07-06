//
//  TrainedImage.h
//  SpecARect
//
//  Created by Isaac Schmidt on 7/6/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle/Mantle.h"

@interface TrainedImage : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *imageFileName;
@property (nonatomic, copy) NSValue *imageFrame;

@end


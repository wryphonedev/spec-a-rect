//
//  TrainedImage.m
//  SpecARect
//
//  Created by Isaac Schmidt on 7/6/18.
//  Copyright © 2018 Isaac Schmidt. All rights reserved.
//

#import "TrainedImage.h"

@implementation TrainedImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"imageFileName": @"fileName",
             @"selectionFrame" : @"frame"
             };
}

+ (NSValueTransformer *)selectionFrameJSONTransformer {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSDictionary *source = (NSDictionary *)value;
        CGRect frame = CGRectMake([[source objectForKey:@"x"] floatValue], [[source objectForKey:@"y"] floatValue], [[source objectForKey:@"width"] floatValue], [[source objectForKey:@"height"] floatValue]);
        return [NSValue valueWithRect:frame];
        
    }
    reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        CGRect rect = [(NSValue *)value rectValue];
        return @{@"x" : @(rect.origin.x), @"y" : @(rect.origin.y), @"width" : @(rect.size.width), @"height" : @(rect.size.height)};
        
    }];
}

@end

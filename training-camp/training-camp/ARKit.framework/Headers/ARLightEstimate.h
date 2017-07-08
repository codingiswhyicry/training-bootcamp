//
//  ARLightEstimate.h
//  ARKit
//
//  Copyright © 2016-2017 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

/**
 A light estimate representing the light in the scene.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
@interface ARLightEstimate : NSObject <NSCopying>

/**
 Ambient intensity of the lighting.
 
 @discussion In a well lit environment, this value is close to 1000. It typically ranges from 0 (very dark) to around 2000 (very bright).
 */
@property (nonatomic, readonly) CGFloat ambientIntensity;

@end

@interface ARLightEstimate (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

//
//  ARAnchor.h
//  ARKit
//
//  Copyright © 2016-2017 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Object representing a physical location and orientation in 3D space.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
@interface ARAnchor : NSObject <NSCopying>

/**
 Unique identifier of the anchor.
 */
@property (nonatomic, readonly) NSUUID *identifier;

/**
 The transformation matrix that defines the anchor's rotation, translation and scale in world coordinates.
 */
@property (nonatomic, readonly) matrix_float4x4 transform;

/**
 Initializes a new anchor object.
 @param transform The transformation matrix that defines the anchor's rotation, translation and scale in world coordinates.
 */
- (instancetype)initWithTransform:(matrix_float4x4)transform;

@end


@interface ARAnchor (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

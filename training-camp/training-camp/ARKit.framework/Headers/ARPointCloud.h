//
//  ARPointCloud.h
//  ARKit
//
//  Copyright © 2016-2017 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
@interface ARPointCloud : NSObject <NSCopying>

/**
 The number of points in the point cloud.
 */
@property (nonatomic, readonly) NSUInteger count;

/**
 The 3D points comprising the point cloud.
 */
@property (nonatomic, readonly) const vector_float3 *points;

@end


@interface ARPointCloud (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

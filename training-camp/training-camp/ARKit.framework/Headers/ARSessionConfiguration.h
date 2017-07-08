//
//  ARSessionConfiguration.h
//  ARKit
//
//  Copyright © 2016-2017 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Enum constants for indicating the world alignment.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
typedef NS_ENUM(NSInteger, ARWorldAlignment) {
    /** Aligns the world with gravity that is defined by vector (0, -1, 0). */
    ARWorldAlignmentGravity,
    
    /** Aligns the world with gravity that is defined by the vector (0, -1, 0)
     and heading (w.r.t. True North) that is given by the vector (0, 0, -1). */
    ARWorldAlignmentGravityAndHeading,
    
    /** Aligns the world with the camera's orientation. */
    ARWorldAlignmentCamera
} NS_SWIFT_NAME(ARSessionConfiguration.WorldAlignment);


/**
 Option set indicating the type of planes to detect.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
typedef NS_OPTIONS(NSUInteger, ARPlaneDetection) {
    /** No plane detection is run. */
    ARPlaneDetectionNone        = 0,
    
    /** Plane detection determines horizontal planes in the scene. */
    ARPlaneDetectionHorizontal  = (1 << 0),

} NS_SWIFT_NAME(ARWorldTrackingSessionConfiguration.PlaneDetection);


/**
 An object to describe and configure the Augmented Reality techniques to be used in an ARSession.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
@interface ARSessionConfiguration : NSObject <NSCopying>

/**
 Determines whether this device supports the ARSessionConfiguration.
 */
@property(class, nonatomic, readonly) BOOL isSupported;

/**
 Determines how the session's coordinate system should be aligned with the world.
 @discussion The default is ARWorldAlignmentGravity.
 */
@property (nonatomic, readwrite) ARWorldAlignment worldAlignment;

/**
 Enable or disable light estimation.
 @discussion Enabled by default.
 */
@property (nonatomic, readwrite, getter=isLightEstimationEnabled) BOOL lightEstimationEnabled;

@end


/**
 A session configuration for world tracking.
 
 @discussion World tracking provides 6 degrees of freedom tracking of the device.
 By finding feature points in the scene, world tracking enables performing hit-tests against the frame.
 Tracking can no longer be resumed once the session is paused.
 */
API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(macos, watchos, tvos)
@interface ARWorldTrackingSessionConfiguration : ARSessionConfiguration

/**
 Type of planes to detect in the scene.
 @discussion If set, new planes will continue to be detected and updated over time. Detected planes will be added to the session as
 ARPlaneAnchor objects. In the event that two planes are merged, the newer plane will be removed. Defaults to ARPlaneDetectionNone.
 */
@property (nonatomic, readwrite) ARPlaneDetection planeDetection;

@end

NS_ASSUME_NONNULL_END

//
//  KLLayoutGuide.h
//  KLLayoutGuide
//
//  Created by KelaKing on 2018/1/25.
//

#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
#error "KLLayoutGuide must be compiled under iOS9 SDK at least"
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000
#warning "No need for KLLayoutGuide with a deploy iOS version greater than 9.0"
#endif

@interface KLLayoutGuide : UIView

/**
 A string used to identify the layout guide.
 */
@property(nonatomic, copy) NSString *identifier;

/**
 The layout guide’s frame in its owning view’s coordinate system.
 */
@property(nonatomic, readonly) CGRect layoutFrame;

/**
 The view that owns this layout guide.
 */
@property(nonatomic, weak) UIView *owningView;

@end

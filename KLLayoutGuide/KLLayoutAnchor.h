//
//  KLLayoutAnchor.h
//  KLLayoutGuide
//
//  Created by KelaKing on 2018/2/4.
//

#import <Foundation/Foundation.h>

@interface KLLayoutAnchor<AnchorType> : NSObject

/* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor;

/* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;

@end

/* Axis-specific subclasses for location anchors: top/bottom, leading/trailing, baseline, etc.
 */
@class KLLayoutXAxisAnchor, KLLayoutYAxisAnchor, KLLayoutDimension;

@interface KLLayoutXAxisAnchor : KLLayoutAnchor<KLLayoutXAxisAnchor *>

@end

@interface KLLayoutYAxisAnchor : KLLayoutAnchor<KLLayoutYAxisAnchor *>

@end

@interface KLLayoutDimension : KLLayoutAnchor<KLLayoutDimension *>

/* These methods return an inactive constraint of the form
 thisVariable = constant.
 */
- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier + constant.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;

@end

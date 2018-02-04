//
//  KLLayoutAnchor.m
//  KLLayoutGuide
//
//  Created by KelaKing on 2018/2/4.
//

#import "KLLayoutAnchor.h"

@interface KLLayoutAnchor ()

@property (nonatomic, weak) UIView *view;
@property (nonatomic, assign) NSLayoutAttribute attribute;

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view;

@end

@implementation KLLayoutAnchor

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView *)view {
    self = [super init];
    if (self) {
        _attribute = attribute;
        _view = view;
    }
    return self;
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutAnchor *)anchor {
    return [self constraintEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutAnchor *)anchor {
    return [self constraintGreaterThanOrEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutAnchor *)anchor {
    return [self constraintLessThanOrEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationEqual toItem:anchor.view attribute:anchor.attribute multiplier:1 constant:c];
    [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
    return constraint;
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:anchor.view attribute:anchor.attribute multiplier:1 constant:c];
    [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
    return constraint;
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationLessThanOrEqual toItem:anchor.view attribute:anchor.attribute multiplier:1 constant:c];
    [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
    return constraint;
}

- (void)addConstraint:(NSLayoutConstraint *)constraint betweenView:(UIView *)view otherView:(UIView *)otherView {
    UIView *parent = [self viewToAddConstraintOnForFirstView:self.view secondView:otherView];
    [parent addConstraint:constraint];
}

- (UIView*)viewToAddConstraintOnForFirstView:(UIView *)firstView secondView:(UIView *)secondView {
    if (firstView == nil || secondView == nil) {
        return nil;
    }
    
    if ([firstView isDescendantOfView:secondView]) {
        return secondView;
    }
    
    if ([secondView isDescendantOfView:firstView]) {
        return firstView;
    }
    
    return [self viewToAddConstraintOnForFirstView:firstView.superview secondView:secondView];
}

@end

@implementation KLLayoutXAxisAnchor

@end

@implementation KLLayoutYAxisAnchor

@end

@implementation KLLayoutDimension

- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c {
    return [self constraintEqualToAnchor:nil multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c {
    return [self constraintGreaterThanOrEqualToAnchor:nil multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c {
    return [self constraintLessThanOrEqualToAnchor:nil multiplier:1 constant:c];
}


- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m {
    return [self constraintEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m {
    return [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m {
    return [self constraintLessThanOrEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationEqual toItem:anchor.view attribute:anchor ? anchor.attribute : NSLayoutAttributeNotAnAttribute multiplier:m constant:c];
    id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
    [viewToAdd addConstraint:constraint];
    
    return constraint;
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:anchor.view attribute:anchor ? anchor.attribute : NSLayoutAttributeNotAnAttribute multiplier:m constant:c];
    id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
    [viewToAdd addConstraint:constraint];
    
    return constraint;
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(KLLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.attribute relatedBy:NSLayoutRelationLessThanOrEqual toItem:anchor.view attribute:anchor ? anchor.attribute : NSLayoutAttributeNotAnAttribute multiplier:m constant:c];
    id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
    [viewToAdd addConstraint:constraint];
    
    return constraint;
}

@end

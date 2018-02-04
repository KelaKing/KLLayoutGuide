//
//  UIView+LayoutGuide.m
//  KLLayoutGuide
//
//  Created by KelaKing on 2018/1/25.
//

#import "UIView+LayoutGuide.h"
#import <objc/runtime.h>
#import "KLLayoutGuide.h"
#import "KLLayoutAnchor.h"

@interface KLLayoutAnchor ()

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView *)view;

@end

@implementation UIView (LayoutGuide)

+ (void)load {
    if ([[UIDevice currentDevice].systemVersion compare:@"9.0"] != NSOrderedAscending) {
        return;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self addMethodIfNeed:@selector(addLayoutGuide:) addSelector:@selector(kl_addLayoutGuide:)];
        [self addMethodIfNeed:@selector(leadingAnchor) addSelector:@selector(kl_leadingAnchor)];
        [self addMethodIfNeed:@selector(trailingAnchor) addSelector:@selector(kl_trailingAnchor)];
        [self addMethodIfNeed:@selector(leftAnchor) addSelector:@selector(kl_leftAnchor)];
        [self addMethodIfNeed:@selector(rightAnchor) addSelector:@selector(kl_rightAnchor)];
        [self addMethodIfNeed:@selector(topAnchor) addSelector:@selector(kl_topAnchor)];
        [self addMethodIfNeed:@selector(bottomAnchor) addSelector:@selector(kl_bottomAnchor)];
        [self addMethodIfNeed:@selector(widthAnchor) addSelector:@selector(kl_widthAnchor)];
        [self addMethodIfNeed:@selector(heightAnchor) addSelector:@selector(kl_heightAnchor)];
        [self addMethodIfNeed:@selector(centerXAnchor) addSelector:@selector(kl_centerXAnchor)];
        [self addMethodIfNeed:@selector(centerYAnchor) addSelector:@selector(kl_centerYAnchor)];
    });
}

+ (void)addMethodIfNeed:(SEL)originalSelector addSelector:(SEL)addSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method addMethod = class_getInstanceMethod(class, addSelector);
    
    if (!originalMethod) {
        class_addMethod(class, originalSelector, method_getImplementation(addMethod), method_getTypeEncoding(addMethod));
    }
}

- (void)kl_addLayoutGuide:(id)layoutGuide {
    if ([layoutGuide isKindOfClass:[KLLayoutGuide class]]) {
        [self addSubview:layoutGuide];
        [(KLLayoutGuide *)layoutGuide setOwningView:self];
    }
}

- (KLLayoutXAxisAnchor *)kl_leadingAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeLeading];
}

- (KLLayoutXAxisAnchor *)kl_trailingAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeTrailing];
}

- (KLLayoutXAxisAnchor *)kl_leftAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeLeft];
}

- (KLLayoutXAxisAnchor *)kl_rightAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeRight];
}

- (KLLayoutYAxisAnchor *)kl_topAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeTop];
}

- (KLLayoutYAxisAnchor *)kl_bottomAnchor{
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeBottom];
}

- (KLLayoutDimension *)kl_widthAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutDimension class] layoutAttribute:NSLayoutAttributeWidth];
}

- (KLLayoutDimension *)kl_heightAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutDimension class] layoutAttribute:NSLayoutAttributeHeight];
}

- (KLLayoutXAxisAnchor *)kl_centerXAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeCenterX];
}

- (KLLayoutYAxisAnchor *)kl_centerYAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[KLLayoutXAxisAnchor class] layoutAttribute:NSLayoutAttributeCenterY];
}

#pragma mark - helpers

- (id)getAnchorAndCreateItIfNeededWithKey:(SEL)anchorSelector anchorClass:(Class)anchorClass layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    id anchor = objc_getAssociatedObject(self, anchorSelector);
    
    if (!anchor) {
        anchor = [[anchorClass alloc] initWithAttribute:layoutAttribute view:self];
        objc_setAssociatedObject(self, anchorSelector, anchor, OBJC_ASSOCIATION_RETAIN);
    }
    
    return anchor;
}

@end

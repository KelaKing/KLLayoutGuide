//
//  KLLayoutGuide.m
//  KLLayoutGuide
//
//  Created by KelaKing on 2018/1/25.
//

#import "KLLayoutGuide.h"
#import <objc/runtime.h>

@implementation KLLayoutGuide

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

+ (void)load {
    if (objc_getClass("UILayoutGuide")) {
        return;
    }
    Class *UILayoutGuideRef = NULL;
#if TARGET_CPU_ARM
    __asm(
          "movw %0, :lower16:(L_OBJC_CLASS_UILayoutGuide-(LPC0+4))\n"
          "movt %0, :upper16:(L_OBJC_CLASS_UILayoutGuide-(LPC0+4))\n"
          "LPC0: add %0, pc" : "=r"(UILayoutGuideRef)
          );
#elif TARGET_CPU_ARM64
    __asm(
          "adrp %0, L_OBJC_CLASS_UILayoutGuide@PAGE\n"
          "add  %0, %0, L_OBJC_CLASS_UILayoutGuide@PAGEOFF" : "=r"(UILayoutGuideRef)
          );
#elif TARGET_CPU_X86_64
    __asm("leaq L_OBJC_CLASS_UILayoutGuide(%%rip), %0" : "=r"(UILayoutGuideRef));
#elif TARGET_CPU_X86
    void *pc = NULL;
    __asm(
          "calll L0\n"
          "L0: popl %0\n"
          "leal L_OBJC_CLASS_UILayoutGuide-L0(%0), %1" : "=r"(pc), "=r"(UILayoutGuideRef)
          );
#else
#error Unsupported CPU
#endif
    if (UILayoutGuideRef && *UILayoutGuideRef == nil) {
        Class UILayoutGuideClass = objc_allocateClassPair(self, "UILayoutGuide", 0);
        if (UILayoutGuideClass) {
            objc_registerClassPair(UILayoutGuideClass);
            *UILayoutGuideRef = UILayoutGuideClass;
        }
    }
}

__asm(
#if defined(__OBJC2__) && __OBJC2__
      ".section        __DATA,__objc_classrefs,regular,no_dead_strip\n"
#if    TARGET_RT_64_BIT
      ".align          3\n"
      "L_OBJC_CLASS_UILayoutGuide:\n"
      ".quad           _OBJC_CLASS_$_UILayoutGuide\n"
#else
      ".align          2\n"
      "L_OBJC_CLASS_UILayoutGuide:\n"
      ".long           _OBJC_CLASS_$_UILayoutGuide\n"
#endif
#else
      ".section        __TEXT,__cstring,cstring_literals\n"
      "L_OBJC_CLASS_NAME_UILayoutGuide:\n"
      ".asciz          \"UILayoutGuide\"\n"
      ".section        __OBJC,__cls_refs,literal_pointers,no_dead_strip\n"
      ".align          2\n"
      "L_OBJC_CLASS_UILayoutGuide:\n"
      ".long           L_OBJC_CLASS_NAME_UILayoutGuide\n"
#endif
      ".weak_reference _OBJC_CLASS_$_UILayoutGuide\n"
      );

@end


// TestFolder/UIViewController
// 
//
// IDECodeSnippetIdentifier: 7851356B-86E8-45E9-8615-8B1882C07A00
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewDidDisappear:);
        SEL swizzledSelector = @selector(fml_viewDidDisappear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)fml_viewDidDisappear:(BOOL)animated
{
    [self fml_viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FMLResetAudioViewNotification object:nil];
}

/// 强制旋转设备
- (void)forceLandscape:(UIInterfaceOrientation)orientation
{
    UIDevice  *myDevice = [UIDevice currentDevice];
    if([myDevice respondsToSelector:@selector(setOrientation:)])
    {
        NSInteger param;
        
        param = orientation;
        
        NSMethodSignature *signature  = [[myDevice class] instanceMethodSignatureForSelector:@selector(setOrientation:)];
        NSInvocation      *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:myDevice];
        [invocation setSelector:@selector(setOrientation:)];
        [invocation setArgument:&param
                        atIndex:2];
        [invocation invoke];
    }
}

@end

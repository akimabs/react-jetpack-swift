// HorizontalSlideAnimator.m

#import "HorizontalSlideAnimator.h"

@implementation HorizontalSlideAnimator {
    BOOL _presenting;
}

- (instancetype)initWithPresenting:(BOOL)presenting {
    self = [super init];
    if (self) {
        _presenting = presenting;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5; // Adjust the duration as needed
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGFloat containerWidth = containerView.frame.size.width;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    CGFloat offset = _presenting ? containerWidth : -containerWidth;
    toViewController.view.frame = CGRectOffset(finalFrame, offset, 0);
    
    [containerView addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.frame = CGRectOffset(finalFrame, -offset, 0);
        toViewController.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end

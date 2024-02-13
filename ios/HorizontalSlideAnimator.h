// HorizontalSlideAnimator.h

#import <UIKit/UIKit.h>

@interface HorizontalSlideAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithPresenting:(BOOL)presenting;

@end

//
//  CustomModule.m
//  sinaureact
//
//  Created by Abdul Hakim on 13/02/24.
//

#import "CustomModule.h"
#import <React/RCTLog.h>
#import "sinaureact-Bridging-Header.h"
#import <UIKit/UIKit.h>
#import "HorizontalSlideAnimator.h"

@implementation CustomModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(navigateToStatistic:(NSArray<NSDictionary *> *)data) {
    RCTLogInfo(@"Pretending to create an event %@", data);
    dispatch_async(dispatch_get_main_queue(), ^{
      // Create an instance of StatisticsViewController
      StatisticViewController *statisticsVC = [[StatisticViewController alloc] init];

      // Wrap StatisticsViewController in a UINavigationController
      UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:statisticsVC];

      // Customize navigation bar if needed
      navController.navigationBar.barTintColor = [UIColor redColor];
      // Set the title for StatisticViewController
      statisticsVC.title = @"Your Title";

      // Or set the title for navigation item
      statisticsVC.navigationItem.title = @"Your Title";

      // Set modal presentation style and custom transition
      navController.modalPresentationStyle = UIModalPresentationFullScreen;
      navController.transitioningDelegate = (id<UIViewControllerTransitioningDelegate>)self;

      // Get the windows from the key window
      NSArray<UIWindow *> *windows = [UIApplication sharedApplication].windows;

      // Get the root view controller from the last window
      UIViewController *rootViewController = windows.lastObject.rootViewController;

      // Present the UINavigationController with StatisticsViewController embedded
      [rootViewController presentViewController:navController animated:YES completion:nil];
    });
}

// Implement the transitioning delegate methods
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[HorizontalSlideAnimator alloc] initWithPresenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[HorizontalSlideAnimator alloc] initWithPresenting:NO];
}

@end

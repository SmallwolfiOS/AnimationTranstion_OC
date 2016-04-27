//
//  ATNavigationDelegate.m
//  AnimationTranstion_OC
//
//  Created by Jason on 16/3/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ATNavigationDelegate.h"
#import "ATransitionAnimator.h"

@interface ATNavigationDelegate ()<UINavigationControllerDelegate>
//@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionController; 
@end

@implementation ATNavigationDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    return (id)[ATransitionAnimator new];
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
//    
//    return self.interactionController;
//}
@end

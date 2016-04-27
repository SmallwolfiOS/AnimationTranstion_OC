//
//  ATransitionAnimator.m
//  AnimationTranstion_OC
//
//  Created by Jason on 16/3/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ATransitionAnimator.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ToViewController.h"

@interface ATransitionAnimator ()<UIViewControllerAnimatedTransitioning>
@property (weak, nonatomic) id transitionContext;
@end

@implementation ATransitionAnimator


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    _transitionContext = transitionContext;
    
    
    // 1. Get controllers from transition context
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (fromVC.class == [ViewController class]) {
            // 3. Add toVC's view to containerView
            UIView *containerView = [transitionContext containerView];
            [containerView addSubview:toVC.view];
            UIButton * btn;
            if (fromVC.class == [ViewController class]) {
                btn = ((ViewController *)fromVC).actionBtn;
            }else if (fromVC.class == [ToViewController class]){
                btn = ((ToViewController *)fromVC).actionBtn;
            }
            UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
            CGPoint extremePoint = CGPointMake(btn.center.x - 0, btn.center.y - CGRectGetHeight(toVC.view.bounds));
        
            float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
        
            UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius, -radius)];
        
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.path = finalPath.CGPath;
            toVC.view.layer.mask = maskLayer;
        
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
            animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
            animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
            animation.duration = [self transitionDuration:transitionContext];
            animation.delegate = self;
            [maskLayer addAnimation:animation forKey:@"path"];
             NSLog(@"world");
        
        //    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //        fromVC.view.transform = CGAffineTransformMakeTranslation(- [UIScreen mainScreen].bounds.size.width, 0);
        //    } completion:^(BOOL finished) {
        //        fromVC.view.transform = CGAffineTransformIdentity;
        //        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        //    }];

    }else{
        UIView *contentView = [transitionContext containerView];
        //    UIButton *button = toVC.actionBtn;
        UIButton * button;
        if (fromVC.class == [ViewController class]) {
            button = ((ViewController *)fromVC).actionBtn;
        }else if (fromVC.class == [ToViewController class]){
            button = ((ToViewController *)fromVC).actionBtn;
        }
        [contentView addSubview:toVC.view];
        [contentView addSubview:fromVC.view];
        
        //绘制大圆
        CGSize sideSize = CGSizeMake(button.center.x, toVC.view.frame.size.height - button.center.y);
        CGFloat radius = sqrt((sideSize.width * sideSize.width) + (sideSize.height * sideSize.height));
        UIBezierPath *startBP = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
        
        //绘制小圆
        UIBezierPath *finalBP = [UIBezierPath bezierPathWithOvalInRect:button.frame];
        
        //设置路径
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = finalBP.CGPath;
        fromVC.view.layer.mask = maskLayer;
        
        //执行动画
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id _Nullable)(startBP.CGPath);
        maskLayerAnimation.toValue = (__bridge id _Nullable)(finalBP.CGPath);
        maskLayerAnimation.duration = [self transitionDuration:transitionContext];
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        maskLayerAnimation.delegate = self;
        //添加动画要在最后添加
        [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];

    }
    
    
    

//    ViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    ToViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
     NSLog(@"!!!!");
}



@end

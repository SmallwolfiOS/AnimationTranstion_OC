//
//  ViewController.m
//  AnimationTranstion_OC
//
//  Created by Jason on 16/3/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _actionBtn.layer.cornerRadius = 25;
    _actionBtn.layer.masksToBounds = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"出现1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

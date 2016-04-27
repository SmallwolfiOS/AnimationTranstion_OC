//
//  ToViewController.m
//  AnimationTranstion_OC
//
//  Created by Jason on 16/3/17.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ToViewController.h"

@interface ToViewController ()
@property (weak, nonatomic) IBOutlet UIButton *popBtn;

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _actionBtn.layer.cornerRadius = 25 ;
    _actionBtn.layer.masksToBounds = YES;
}
- (IBAction)popAction:(UIButton *)sender {
//    NSArray * array = [[self.navigationController.viewControllers reverseObjectEnumerator]allObjects];
//    [self.navigationController setViewControllers:@[array[1]] animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"hello   ====%@",self.navigationController.viewControllers);
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"出现2");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  CTHandyCategories
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+CTAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self ct_showAlertInputWithTitle:@"test"
                             message:@"input"
                     placeholderList:@[@"inputA", @"inputB"]
                         actionTitle:@"OK"
                             handler:^(UIAlertAction *action, UIAlertController *alertController) {
                                 [alertController.textFields enumerateObjectsUsingBlock:^(UITextField * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                     NSLog(@"%@", obj.text);
                                 }];
                             }
                          completion:nil];
}

@end

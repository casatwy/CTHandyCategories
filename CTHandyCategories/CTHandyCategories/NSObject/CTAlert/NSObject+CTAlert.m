//
//  NSObject+CTAlert.m
//  CTHandyCategories
//
//  Created by casa on 2018/3/8.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "NSObject+CTAlert.h"
#import <UIKit/UIKit.h>
#import "NSObject+CTNavigation.h"

@implementation NSObject (CTAlert)

- (void)ct_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                  actionTitle:(NSString *)actionTitle
                      handler:(void (^)(UIAlertAction *))handler
                   completion:(void (^)(void))completion
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionTitle
                                                          style:UIAlertActionStyleDefault
                                                        handler:handler];
    [alertController addAction:alertAction];
    [self ct_presentViewController:alertController animated:YES completion:completion];
}

- (void)ct_showAlertInputWithTitle:(NSString *)title
                      message:(NSString *)message
                   placeholderList:(NSArray<NSString *> *)placeholderList
                       actionTitle:(NSString *)actionTitle
                           handler:(void (^)(UIAlertAction *, UIAlertController *))handler
                        completion:(void (^)(void))completion
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *placeholder in placeholderList) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeholder;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        }];
    }
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            if (handler) {
                                                                handler(action, alertController);
                                                            }
                                                        }];
    
    [alertController addAction:action];
    [self ct_presentViewController:alertController animated:YES completion:completion];
}

@end

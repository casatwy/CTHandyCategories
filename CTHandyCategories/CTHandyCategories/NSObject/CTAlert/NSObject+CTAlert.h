//
//  NSObject+CTAlert.h
//  CTHandyCategories
//
//  Created by casa on 2018/3/8.
//  Copyright © 2018年 casa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (CTAlert)

- (void)ct_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                  actionTitle:(NSString *)actionTitle
                      handler:(void(^)(UIAlertAction * action))handler
                   completion:(void (^)(void))completion;

- (void)ct_showAlertInputWithTitle:(NSString *)title
                      message:(NSString *)message
                   placeholderList:(NSArray <NSString *> *)placeholderList
                       actionTitle:(NSString *)actionTitle
                           handler:(void(^)(UIAlertAction * action, UIAlertController * alertController))handler
                        completion:(void (^)(void))completion;

@end

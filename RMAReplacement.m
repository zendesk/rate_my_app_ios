//
//  RMAReplacement.m
//  RateMyAppExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

#import "RMAReplacement.h"
#import <ZendeskProviderSDK/ZDKLocalization.h>
#import <ZendeskSDK/ZDKRequests.h>

NSString * const RMA_VersionKey = @"app-version";
NSString * const RMA_SuiteName = @"com.zendesk.rma";
NSString * const RMA_Bundle = @"RateMyAppStrings.bundle";


NSString * const RMA_title = @"ios.RMA.dialog.header.title";
NSString * const RMA_rate = @"ios.RMA.dialog.rateApp.button";
NSString * const RMA_comment = @"ios.RMA.dialog.sendFeedback.button";
NSString * const RMA_decline = @"ios.RMA.dialog.dismiss.button";

@interface RMAReplacement ()

@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation RMAReplacement

- (instancetype)initWith:(NSString *)appVersion {
    
    self = [super init];
    
    if (self) {
        self.appVersion = appVersion;
        self.defaults = [[NSUserDefaults alloc] initWithSuiteName:RMA_SuiteName];
    }
    
    return self;
}

- (void)displayRMAWithViewController:(UIViewController *)viewController {
    
    NSString *storedVersion = [self.defaults stringForKey:RMA_VersionKey];
    
    if (storedVersion && [storedVersion isEqualToString:self.appVersion]) {
        return;
    }
    
    UIAlertController *alertController = [self buildAlertControllerWithViewController:viewController];
    [viewController presentViewController:alertController animated:YES completion:^{
        [self.defaults setValue:self.appVersion forKey:RMA_VersionKey];
    }];
}

- (UIAlertController *)buildAlertControllerWithViewController:(UIViewController*)viewController {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[self title]
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:[self rate]
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                      }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:[self comment]
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          [ZDKRequests presentRequestCreationWithViewController:viewController];
                                                      }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:[self decline]
                                                        style:UIAlertActionStyleDefault
                                                      handler:nil]];
    
    return alertController;
}

- (NSString*)title {
    return [[RMAReplacement bundle] localizedStringForKey:RMA_title
                                                    value:nil
                                                    table:nil];
}

- (NSString*)rate {
    return [[RMAReplacement bundle] localizedStringForKey:RMA_rate
                                                    value:nil
                                                    table:nil];
}

- (NSString*)comment {
    return [[RMAReplacement bundle] localizedStringForKey:RMA_comment
                                                    value:nil
                                                    table:nil];
}

- (NSString*)decline {
    return [[RMAReplacement bundle] localizedStringForKey:RMA_decline
                                                    value:nil
                                                    table:nil];
}

+ (NSBundle *) bundle
{
    static NSBundle *frameworkStringsBundle = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        NSString *frameworkBundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:RMA_Bundle];
        frameworkStringsBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    });
    
    return frameworkStringsBundle;
}

@end

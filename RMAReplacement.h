//
//  RMAReplacement.h
//  RateMyAppExample
//
//  Created by Alan Egan on 23/03/2017.
//  Copyright © 2017 Zendesk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMAReplacement : NSObject

- (instancetype)initWith:(NSString *)appVersion;
- (void)displayRMAWithViewController:(UIViewController*)viewController;

@end

NS_ASSUME_NONNULL_END

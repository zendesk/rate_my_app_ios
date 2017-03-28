//
//  RMAReplacement.swift
//  RateMyAppExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import UIKit
import ZendeskSDK

struct RMAReplacement {
    
    private let defaults: UserDefaults? = UserDefaults(suiteName: "com.zendesk.rma")
    private let versionKey = "app-version"
    private let appVersion: String
    
    init(appVersion: String) {
        self.appVersion = appVersion
    }
    
    enum AlertStrings {
        static var title: String {
            return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.header.title")
        }
        
        static var rate: String {
            return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.rateApp.button")
        }
        
        static var comment: String {
            return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.sendFeedback.button")
        }
        
        static var decline: String {
            return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.dismiss.button")
        }
    }
    
    func displayRMA(with viewController: UIViewController) {
        
        if let stored = defaults?.string(forKey: versionKey) {
            if stored == appVersion {
                return
            }
        }
        
        let alertController = buildAlertController(with: viewController)
        
        viewController.present(alertController, animated: true) {
            self.defaults?.set(self.appVersion, forKey: self.versionKey)
        }
    }
    
    private func buildAlertController(with viewController: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: AlertStrings.title,
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: AlertStrings.rate, style: .default, handler: { action in
            guard
                let url = URL(string: "itms-apps://itunes.apple.com/app/<your-app-id>") else {
                    return
            }
            UIApplication.shared.open(url)
        }))
        
        alertController.addAction(UIAlertAction(title: AlertStrings.comment, style: .default, handler: { action in
            ZDKRequests.presentRequestCreation(with: viewController)
        }))
        
        alertController.addAction(UIAlertAction(title: AlertStrings.decline, style: .default, handler: nil))
        
        return alertController
    }
}

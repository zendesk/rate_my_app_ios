//
//  AlertControllerUtil.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import Foundation

enum AlertControllerUtil {
    
    
    /// Creates an alert controler with the strings provided in the 
    /// `Configuration` passed in. Each alert action calls through to 
    /// a corresponding `ActionHandler` function.
    ///
    /// - Parameters:
    ///   - configuration: Configuration used to fill the titles of the alert
    ///   - actionHandler: ActionHandler call by each action on the alert
    /// - Returns: A configured alert controller.
    static func create(with configuration: Configuration,
                       actionHandler: ActionHandler) -> UIAlertController {
        
        return createAlertController(title: configuration.strings.title,
                                     message: configuration.strings.message,
                                     actions: self.createAlertActions(configuration: configuration, actionHandler: actionHandler))
    }
    
    static private func createAlertController(title: String,
                                              message: String,
                                              actions: [UIAlertAction]) -> UIAlertController {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        return alertController
    }
    
    static private func createAlertActions(configuration: Configuration,
                                           actionHandler: ActionHandler) -> [UIAlertAction] {
        let s = configuration.strings
        let version = configuration.appVersion
        var actionHandler = actionHandler
        var acions = [UIAlertAction]()
        
        acions.append(self.action(title: s.rate,
                                  handler: { _ in
                                    
                                    actionHandler.storeInteraction(versionString: version)
                                    actionHandler.rate()
        }))
        
        acions.append(self.action(title: s.comment,
                                  handler: { _ in
                                    
                                    actionHandler.storeInteraction(versionString: version)
                                    actionHandler.comment()
        }))
        
        acions.append(self.action(title: s.decline,
                                  handler: { _ in
                                    
                                    actionHandler.storeInteraction(versionString: version)
                                    actionHandler.decline()
        }))
        
        return acions
    }
    
    static private func action(title: String, handler: @escaping (UIAlertAction)-> Void) -> UIAlertAction {
        return UIAlertAction(title: title,
                             style: .default,
                             handler: handler)
    }
}

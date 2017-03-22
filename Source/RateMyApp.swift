//
//  RateMyApp.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//


public struct RateMyApp {
    
    /// The configuration for this Rate My App.
    public let configuration: Configuration
    
    /// Implementation of `ActionHandler` which
    /// will be called when the user selects an option.
    public let actionHandler: ActionHandler
    
    
    /// Creates a `RateMyApp` with the provided parameters.
    ///
    /// - Parameters:
    ///   - configuration: a configuration to use when displaying Rate My App.
    ///   - outcome: Ipmlemnetation of `ActionHandler`.
    public init(configuration: Configuration,
                actionHandler: ActionHandler) {
        
        self.configuration = configuration
        self.actionHandler = actionHandler
    }
}

// MARK: Displaying
extension RateMyApp {
    
    /// Displays Rate My App alert if the configured rules permit.
    ///
    /// - Parameter viewController: present Rate My App with this view controller.
    public func present(with viewController: UIViewController) {
        
        guard configuration.canDisplay else {
            return
        }
        
        previewRateMyApp(with: viewController)
    }
    
    
    /// Displays Rate My App alert unconditionaly. 
    ///
    /// - Parameter viewController: present Rate My App with this view controller.
    public func previewRateMyApp(with viewController: UIViewController) {
        
        let alertController = AlertControllerUtil.create(with: configuration,
                                                         actionHandler: actionHandler)
        
        viewController.present(alertController,
                               animated: true,
                               completion: nil)
    }
}

//
//  Configuration.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

/// Everything required for Rate My App to function.
public protocol Configuration {
    
    /// Rules used when deciding to show the dialog.
    var rules: [Rule] { get }
    
    /// Provides the strings used in the alert.
    var strings: DialogStrings { get }
    
    /// The current version of your app. This should
    /// be your should bundle version string, e.g 1.3.2.
    var appVersion: String { get }
    
    /// Iterates through `rules` returning **true** if
    /// all return **true**, **false** otherwise.
    var canDisplay: Bool { get }
}


/// Everything required for Rate My App to function.
public struct RateMyAppConfiguration: Configuration {
    
    /// Rules used when deciding to show the dialog.
    public let rules: [Rule]
    
    /// Provides the strings used in the alert.
    public let strings: DialogStrings
    
    /// The current version of your app. This should 
    /// be your should bundle version string, e.g 1.3.2.
    public let appVersion: String
    
    /// Iterates through `rules` returning **true** if 
    /// all return **true**, **false** otherwise.
    public var canDisplay: Bool {
        
        var canDisplay = true
        
        for rule in rules {
            
            let display = rule.permitDisplay
            
            if display == false {
                NSLog(rule.denialMessage)
            }
            
            canDisplay = display && canDisplay
        }
        return canDisplay
    }
    
    /// Creates a `RateMyAppConfiguration` with the given parameters.
    ///
    /// - Parameters:
    ///   - rules: a set of `Rule` implementations.
    ///   - strings: Implementations of 'DialogStrings` used in the alert view.
    ///   - appVersion: the current app version.
    ///   - appStoreUrl: URL for App Store rating
    public init(rules: [Rule] = [],
                strings: DialogStrings,
                appVersion: String) {
        
        self.rules = rules
        self.appVersion = appVersion
        self.strings = strings
    }
    
}

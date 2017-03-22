//
//  ActionHandler.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

/// Defines behaviour for the outcome of a user 
/// interaction with a Rate My App alert.
public protocol ActionHandler {
    
    /// Called for all actions on the alert.
    ///
    /// - Parameter versionString: The versionString Rate My App was configured with. 
    mutating func storeInteraction(versionString: String)
    
    /// Called when a user chooses to rate
    /// the app.
    func rate()
    
    /// Called when a user chooses to leave a
    /// comment about the app.
    func comment()
    
    /// Called when a user declines to give
    /// any form of feedback.
    func decline()
}

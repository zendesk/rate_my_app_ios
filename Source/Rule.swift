//
//  Rule.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

/// Defines the behaviour of a rule which will permit
/// Rate My App alet to show or not.
public protocol Rule {
    
    /// **true** if this rule permits the showing
    /// of the dialogue, **false** if it does not.
    var permitDisplay: Bool { get }
    
    /// Returns an explanation for why `permitDisplay`
    /// returned **false**.
    var denialMessage: String { get }
}

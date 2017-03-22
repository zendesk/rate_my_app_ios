//
//  DialogStrings.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

/// Defines text required for Rate My App dialog.
public protocol DialogStrings {
    
    /// The text shown in the title of the alert.
    var title: String { get }
    
    /// The text shown in the message of the alert.
    var message: String { get }
    
    /// The title of the rate action in the alert.
    var rate: String { get }
    
    /// The title of the comment action in the alert.
    var comment: String { get }
    
    /// The title of the decline action in the alert.
    var decline: String { get }
}

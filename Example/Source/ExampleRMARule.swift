//
//  ExampleRMARule.swift
//  RateMyAppExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import RateMyApp

/// An example rule which matches on app version, blocking 
/// the presentation of Rate My App if the storage contains
/// a version which matches the version supplied.
struct ExampleRMARule: Rule {
    
    /// The current app version.
    let currentVersion: String
    
    /// Storage for app version.
    let storage: VersionStorage
    
    /// Creates an example rule with a version and storage.
    ///
    /// - Parameters:
    ///   - currentVersion: The current app version.
    ///   - storage: Storage for app version, defaults to RateMyAppVersionStorage.shared.
    init(currentVersion: String,
         storage: VersionStorage = RateMyAppVersionStorage.shared) {
        
        self.currentVersion = currentVersion
        self.storage = storage
    }
    
    /// Checks if the storage contains the a version which
    /// matches `currentVersion`, returning **true** if no 
    /// match is found, **false** otherwhise
    var permitDisplay: Bool {
        
        guard
            let storedVersion = storage.version else {
                return true
        }
        
        return currentVersion != storedVersion
    }
    
    /// A message explaining why this rule returns **false** from `permitDisplay`.
    var denialMessage: String {
        return "Cannot show RateMyApp alert, user has selected not to show again for this version"
    }
}

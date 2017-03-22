//
//  VersionStorage.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//


/// Defines storeage interface for Rate My App.
public protocol VersionStorage {
    
    /// Store the current version.
    ///
    /// - Parameter version: a version string to store.
    var version: String? { get set }
}


/// Version storage for Rate My App.
public struct RateMyAppVersionStorage: VersionStorage {
    
    /// A user defaults object where the version is stored.
    let defaults: UserDefaults?
    
    /// A shared storage
    public static var shared: VersionStorage {
        return RateMyAppVersionStorage(defaults: UserDefaults(suiteName: Constants.suiteName))
    }
    
    public var version: String? {
        get {
            return defaults?.string(forKey: Constants.versionKey)
        }
        set {
            defaults?.set(newValue, forKey: Constants.versionKey)
            defaults?.synchronize()
        }
    }
}

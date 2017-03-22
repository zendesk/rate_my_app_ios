//
//  RateMyAppVersionStorageSpec.swift
//  RateMyApp
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import XCTest
@testable import RateMyApp

let suiteName = "com.zendesk.tests"
class RateMyAppVersionStorageSpec: XCTestCase {
    
    let storage = RateMyAppVersionStorage(defaults: UserDefaults(suiteName: suiteName))
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        storage.defaults?.removePersistentDomain(forName: suiteName)
        super.tearDown()
    }
    
    func testEmptyStoreReturnsNilVersionString() {
        let version = storage.version()
        assert(version == nil, "version should be nil, got \(version)")
    }
    
    func testStoringVersionString() {
        let versionString = "1.2.3"
        storage.set(version: versionString)
        let version = storage.version()
        assert(version == versionString, "version should be \(versionString), got \(version)")
    }

    func testOverwritingVersionString() {
        let versionString = "1.2.3"
        storage.set(version: versionString)
        let version = storage.version()
        assert(version == versionString, "version should be \(versionString), got \(version)")
        
        let overwriteWithVersionString = "1.2.4"
        storage.set(version: overwriteWithVersionString)
        let nextVersion = storage.version()
        assert(nextVersion == overwriteWithVersionString, "version should be \(overwriteWithVersionString), got \(nextVersion)")
    }
}

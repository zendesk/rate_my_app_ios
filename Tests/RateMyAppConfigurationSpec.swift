//
//  RateMyAppConfigurationSpec.swift
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

class RateMyAppConfigurationSpec: XCTestCase {
    
    struct TestStrings: DialogStrings {
        var title = "Test title"
        var message = "Test message"
        var rate = "Test rate"
        var comment = "Test comment"
        var decline = "Test decline"
    }
    
    struct TruthyRule: Rule {
        var permitDisplay = true
        var denialMessage = "This rule is always true"
    }
    
    struct FalsyRule: Rule {
        var permitDisplay = false
        var denialMessage = "This rule is always false"
    }
    
    func testEmptyRulesWillAlwaysDisplay() {
        let configuration = RateMyAppConfiguration(rules: [],
                                                   strings: TestStrings(),
                                                   appVersion: "1")
        
        XCTAssert(configuration.canDisplay, "Expected true, got \(configuration.canDisplay)")
    }
    
    func testTruthyRuleWillAlwaysDisplay() {
        let configuration = RateMyAppConfiguration(rules: [TruthyRule()],
                                                   strings: TestStrings(),
                                                   appVersion: "1")
        
        XCTAssert(configuration.canDisplay, "Expected true, got \(configuration.canDisplay)")
    }
    
    func testFalsyRuleWillNeverDisplay() {
        let configuration = RateMyAppConfiguration(rules: [FalsyRule()],
                                                   strings: TestStrings(),
                                                   appVersion: "1")
        
        XCTAssertFalse(configuration.canDisplay, "Expected false, got \(configuration.canDisplay)")
    }
    
    
    func testTruthyAndFalsyWillNeverDisplay() {
        let configuration = RateMyAppConfiguration(rules: [TruthyRule(), FalsyRule()],
                                                   strings: TestStrings(),
                                                   appVersion: "1")
        
        XCTAssertFalse(configuration.canDisplay, "Expected false, got \(configuration.canDisplay)")
    }
}

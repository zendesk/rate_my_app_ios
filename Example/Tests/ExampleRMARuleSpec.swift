//
//  ExampleRMARuleSpec.swift
//  RateMyAppExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import XCTest
import RateMyApp
@testable import RateMyAppExample

class ExampleRMARuleSpec: XCTestCase {
    
    struct TestStorage: VersionStorage {
        var version: String?
    }

    func testExampleRulePermitsDisplayWithNoPreviousVersion() {
        let rmaRule = ExampleRMARule(currentVersion: "1", storage: TestStorage(version: nil))
        
        XCTAssert(rmaRule.permitDisplay, "Expected true, got \(rmaRule.permitDisplay)")
    }
    
    func testExampleRuleBlocksDisplayWhenVersionIsSameAsStored() {
        let rmaRule = ExampleRMARule(currentVersion: "1", storage: TestStorage(version: "1"))
        
        XCTAssertFalse(rmaRule.permitDisplay, "Expected false, got \(rmaRule.permitDisplay)")
    }
    
    func testExampleRulePermitsDisplayWhenVersionIsDifferentToStored() {
        let rmaRule = ExampleRMARule(currentVersion: "2", storage: TestStorage(version: "1"))
        
        XCTAssert(rmaRule.permitDisplay, "Expected true, got \(rmaRule.permitDisplay)")
    }
}

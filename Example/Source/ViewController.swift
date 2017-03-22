//
//  ViewController.swift
//  RateMyAppExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import UIKit
import RateMyApp

class ViewController: UIViewController {

    let configuration = RateMyAppConfiguration(rules: [ExampleRMARule(currentVersion: "1.0.1")],
                                               strings: ExampleRMAStrings(),
                                               appVersion: "1.0.1")
    @IBAction func displayRateMyApp() {
        
        
        let rateMyApp = RateMyApp(configuration: configuration,
                                  actionHandler: ExampleRMAActionHandler(viewController: self,
                                                            appId: "id368796007"))
        
        rateMyApp.present(with: self)
    }
    
    @IBAction func previewRateMyApp() {
        
        let rateMyApp = RateMyApp(configuration: configuration,
                                  actionHandler: ExampleRMAActionHandler(viewController: self,
                                                                         appId: "id368796007"))
        
        rateMyApp.previewRateMyApp(with: self)
    }
}


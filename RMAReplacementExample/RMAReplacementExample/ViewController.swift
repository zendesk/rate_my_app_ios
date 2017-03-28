//
//  ViewController.swift
//  RMAReplacementExample
//
//  Copyright © 2017 Zendesk. All rights reserved.
//
//  By downloading or using Rate My App, You agree to the Zendesk Master
//  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
//  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
//  acknowledge that such terms govern Your use of and access to Rate My App.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    @IBAction func rateApp() {
        
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            let rma = RMAReplacement(appVersion: "1.0.1")
            rma.displayRMA(with: self)
        }
    }
}


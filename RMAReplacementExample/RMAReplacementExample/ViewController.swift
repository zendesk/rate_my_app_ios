//
//  ViewController.swift
//  RMAReplacementExample
//
//  Created by Alan Egan on 27/03/2017.
//  Copyright © 2017 Zendesk. All rights reserved.
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


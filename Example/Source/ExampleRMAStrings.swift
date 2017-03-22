//
//  ExampleRMAStrings.swift
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
import ZendeskProviderSDK

struct ExampleRMAStrings: DialogStrings {
    var title: String {
        return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.header.title")
    }
    
    var message: String {
        return ""
    }
    
    var rate: String {
        return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.rateApp.button")
    }
    
    var comment: String {
        return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.sendFeedback.button")
    }
    
    var decline: String {
        return ZDKLocalization.localizedString(withKey: "ios.RMA.dialog.dismiss.button")
    }
}

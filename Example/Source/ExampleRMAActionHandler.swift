//
//  ExampleRMAActionHandler.swift
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
import ZendeskSDK

/// An example implementation of an `Outcome`.
struct ExampleRMAActionHandler: ActionHandler {
    
    /// A view controller used to present create request 
    /// from ZendeskSDK.
    let viewController: UIViewController
    
    /// Used for storing the version of the app at the 
    /// time of displaying Rate My App.
    var storage: VersionStorage

    /// The app Id used when attempting to open the app store.
    let appId: String
    
    /// Creates `ExampleRMAActionHandler` with the provided paramaters.
    ///
    /// - Parameters:
    ///   - viewController: used to present ZendeskSDK create request.
    ///   - storage: used for storing the current app version. Defaults to `RateMyAppVersionStorage.shared`
    ///   - appId: App Store id for the app.
    init(viewController: UIViewController,
         storage: VersionStorage = RateMyAppVersionStorage.shared,
         appId: String) {
        
        self.viewController = viewController
        self.storage = storage
        self.appId = appId
    }
    
    /// Called by Rate My App. Stores the version string provided.
    ///
    /// - Parameter versionString: version string passed when configuring Rate My App.
    mutating func storeInteraction(versionString: String) {
        storage.version = versionString
    }
    
    /// Called by Rate My App. Attempt to open the app store with the app id provided.
    func rate() {
        guard
            let url = URL(string: "itms-apps://itunes.apple.com/app/" + appId) else {
                return
        }
        UIApplication.shared.open(url)
    }
    
    /// Called by Rate My App. Opens ZendeskSDK create request, 
    /// presented from with the view controller passed during initialisation.
    func comment() {
        ZDKRequests.presentRequestCreation(with: viewController)
    }
    
    /// Called by Rate My App. Logs a message stating that the user opted out of 
    /// Rate My App for this version. 
    func decline() {
        NSLog("Chose not to be asked again for the current version")
    }
}

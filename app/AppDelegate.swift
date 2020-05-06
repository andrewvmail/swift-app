//
//  AppDelegate.swift
//  app
//
//  Created by Andrew Tan on 2020-04-15.
//  Copyright © 2020 Andrew Tan. All rights reserved.
//

import UIKit
import SwiftUI

enum SipError: Error {
    case libre
    case config
    case stack
    case modules
    case userAgent
    case call
}



final class SipClient {

    required init?(agent: inout OpaquePointer?) throws {
        guard libre_init() == 0 else { throw SipError.libre }

        // Initialize dynamic modules.
        mod_init()

        // Make configure file.
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            conf_path_set(path)
        }
        guard conf_configure() == 0 else { throw SipError.config }

        // Initialize the SIP stack.
        guard ua_init("SIP", 1, 1, 1) == 0 else { throw SipError.stack }

        // Load modules.
        guard conf_modules() == 0 else { throw SipError.modules }

        let addr = "sip:user:password@server.com:port;transport=udp;answermode=auto"

        // Start user agent.
        guard ua_alloc(&agent, addr) == 0 else { throw SipError.userAgent }

        // Make an outgoing call.
        guard ua_connect(agent, nil, nil, "sip:target@server.com:port", VIDMODE_OFF) == 0 else { throw SipError.call }

        // Start the main loop.
        re_main(nil)
    }

    func close(agent: OpaquePointer) {
        mem_deref(UnsafeMutablePointer(agent))
        ua_close()
        mod_close()

        // Close and check for memory leaks.
        libre_close()
        tmr_debug()
        mem_debug()
    }

}

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
    }


    // MARK: UISceneSession Lifecycle


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }


    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }



}



struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
                .onTapGesture {
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            keyWindow?.endEditing(true)
        }
    }
}

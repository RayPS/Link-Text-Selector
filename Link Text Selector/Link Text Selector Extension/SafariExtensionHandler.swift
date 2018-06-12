//
//  SafariExtensionHandler.swift
//  Link Text Selector Extension
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {

    
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        page.getPropertiesWithCompletionHandler { properties in
//            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
            if messageName == "askForHotKey" {
                let userDefaults = UserDefaults(suiteName: "group.Link-Text-Selector")
                let hotKey = userDefaults?.string(forKey: "hotKey") ?? "Shift"
                page.dispatchMessageToScript(withName: "answerForHotKey", userInfo: ["hotKey": hotKey])
            }
        }


    }
}

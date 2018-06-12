//
//  AppDelegate.swift
//  Link Text Selector
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBAction func aboutMenuItemClicked(_ sender: Any) {
        if let url = URL(string: "http://lab.rayps.com/lts"), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
    }


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


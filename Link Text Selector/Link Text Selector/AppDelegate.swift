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

    @IBAction func websiteMenuItemClicked(_ sender: Any) {
        if let url = URL(string: "http://lab.rayps.com/lts"), NSWorkspace.shared.open(url) {
        }
    }

    @IBAction func authorMenuItemClicked(_ sender: Any) {
        if let url = URL(string: "http://rayps.com"), NSWorkspace.shared.open(url) {
        }
    }

    @IBAction func sourceCodeMenuItemClicked(_ sender: Any) {
        if let url = URL(string: "https://github.com/RayPS/Link-Text-Selector/"), NSWorkspace.shared.open(url) {
        }
    }

    @IBAction func closeMenuItemClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    


}


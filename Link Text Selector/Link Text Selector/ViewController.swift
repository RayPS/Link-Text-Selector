//
//  ViewController.swift
//  Link Text Selector
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSWindowDelegate {

    @IBOutlet weak var radioButton_shift: NSButton!
    @IBOutlet weak var radioButton_control: NSButton!
    @IBOutlet weak var radioButton_option: NSButton!
    @IBOutlet weak var radioButton_command: NSButton!

    let keys = ["Shift", "Control", "Alt", "Meta"]

    var userDefaults: UserDefaults?

    var hotKey = String() {
        didSet {
            let radioButtons: [String: NSButton] = [
                "Shift": radioButton_shift,
                "Control": radioButton_control,
                "Alt": radioButton_option,
                "Meta": radioButton_command
            ]

            radioButtons[hotKey]?.state = .on

            userDefaults?.set(hotKey, forKey: "hotKey")
            userDefaults?.synchronize()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults = UserDefaults(suiteName: "group.Link-Text-Selector")
    }

    override func viewDidAppear() {
        view.window!.delegate = self
        view.window!.styleMask.remove(.resizable)
        hotKey = userDefaults?.string(forKey: "hotKey") ?? keys.first!
    }

    func windowShouldClose(_ sender: NSWindow) -> Bool {
        NSApplication.shared.terminate(self)
        return true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func hotKeyRadioButtonSelected(_ sender: NSMatrix) {
        hotKey = keys[sender.selectedTag()]
    }
}


//
//  ViewController.swift
//  Link Text Selector
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Cocoa
import SafariServices

class ViewController: NSViewController, NSWindowDelegate {

    @IBOutlet weak var radioButton_shift: NSButton!
    @IBOutlet weak var radioButton_control: NSButton!
    @IBOutlet weak var radioButton_option: NSButton!
    @IBOutlet weak var radioButton_command: NSButton!

    @IBOutlet weak var enableIndicator: NSTextField!
    @IBOutlet weak var infomationLabel: NSTextField!
    @IBOutlet weak var enableButton: NSButton!

    let extId = "com.rayps.Link-Text-Selector.Link-Text-Selector-Extension"

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

    override func viewWillAppear() {
        checkExtensionState()
    }

    override func viewDidAppear() {
        view.window!.delegate = self
        view.window!.styleMask.remove(.resizable)
        hotKey = userDefaults?.string(forKey: "hotKey") ?? keys.first!

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkExtensionState), userInfo: nil, repeats: true)
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

    @objc func checkExtensionState() {
        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extId) { (state, error) in
            DispatchQueue.main.async {
                if let status = state?.isEnabled {
                    self.enableIndicator.textColor = status ? .systemGreen : .systemRed
                    self.infomationLabel.stringValue = status ? "Enabled" : "Extension is currently disabled, enable in Safari preferences"
                    self.enableButton.isHidden = status
                }
            }
        }
    }

    @IBAction func enableButtonClicked(_ sender: Any) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: extId)
    }

    @IBAction func hotKeyRadioButtonSelected(_ sender: NSMatrix) {
        hotKey = keys[sender.selectedTag()]
    }
}


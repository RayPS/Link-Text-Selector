//
//  ViewController.swift
//  Link Text Selector
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear() {
        view.window!.styleMask.remove(.resizable)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


//
//  PopoverViewController.swift
//  iArbitrate
//
//  Created by Ewen Brun on 18/10/2018.
//  Copyright © 2018 3wnbr1. All rights reserved.
//


import Cocoa
import ServiceManagement
import DiskArbitration


class PopoverViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func PreventMounting(_ sender: NSButtonCell) {
        switch sender.state {
        case .off:
            DiskArbitrator.mount = true
        default:
            DiskArbitrator.mount = false
        }
    }
    
    @IBAction func StartAtLogin(_ sender: NSButtonCell) {
        switch sender.state {
        case .off:
            _ = SMLoginItemSetEnabled("com.3wnbr1.Alta-Xerus" as CFString, false)
        default:
            _ = SMLoginItemSetEnabled("com.3wnbr1.Alta-Xerus" as CFString, true)
        }
    }
    
    @IBAction func ExitApp(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    static func freshController() -> PopoverViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("PopoverViewController")
        let view_controller = storyboard.instantiateController(withIdentifier: identifier) as? PopoverViewController
        return view_controller!
    }
}

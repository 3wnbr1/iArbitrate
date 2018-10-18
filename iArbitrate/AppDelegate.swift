//
//  AppDelegate.swift
//  iArbitrate
//
//  Created by Ewen Brun on 18/10/2018.
//  Copyright © 2018 3wnbr1. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let status = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()
    let arbitrator = DiskArbitrator()
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = status.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(tooglePopover(_:))
        }
        popover.contentViewController = PopoverViewController.freshController()
    }
    
    @objc func tooglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = status.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

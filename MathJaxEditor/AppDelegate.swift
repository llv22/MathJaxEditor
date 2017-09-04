//
//  AppDelegate.swift
//  MathJaxEditor
//
//  Created by Ding, Orlando on 30/08/2017.
//  Copyright © 2017 Ding, Orlando. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // see https://stackoverflow.com/questions/42322146/how-to-paste-an-nsimage-correctly-from-nspasteboard
    @IBAction func copy(_ sender: Any) {
        if let window = NSApplication.shared().mainWindow {
            // see https://stackoverflow.com/questions/25708649/downcasting-optionals-in-swift-as-type-or-as-type - downport type
            if let viewController = window.contentViewController as? ViewController {
                viewController.copyWebContent()
            }
        }
    }
    
    @IBAction func paste(_ sender: Any) {
        if let window = NSApplication.shared().mainWindow {
            if let viewController = window.contentViewController as? ViewController {
                viewController.pasteWebContent()
            }
        }
    }
    
    @IBAction func selectAll(_ sender: Any) {
        if let window = NSApplication.shared().mainWindow {
            if let viewController = window.contentViewController as? ViewController {
                viewController.selectAllWebContent()
            }
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // see https://stackoverflow.com/questions/3941960/quit-app-when-nswindow-closes
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}


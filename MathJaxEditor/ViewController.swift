//
//  ViewController.swift
//  MathJaxEditor
//
//  Created by Ding, Orlando on 30/08/2017.
//  Copyright © 2017 Ding, Orlando. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webviewEditor: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // see : https://stackoverflow.com/questions/24882834/wkwebview-not-loading-local-files-under-ios-8
        let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource:"mathjax-offline-editor", ofType: "html")!)
        webviewEditor.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


//
//  ViewController.swift
//  MathJaxEditor
//
//  Created by Ding, Orlando on 30/08/2017.
//  Copyright © 2017 Ding, Orlando. All rights reserved.
//

import Cocoa
import WebKit

/**
 * core reference: https://mislavjavor.github.io/2016-03-08/WKWebView-advanced-tutorial/
 */
class ViewController: NSViewController {

    // see https://stackoverflow.com/questions/34751860/get-html-from-wkwebview-in-swift
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
    
    private func removeSymbol(_ htmlContent: String) -> String {
        let content = htmlContent.trimmingCharacters(in: CharacterSet.newlines)
        return content.trimmingCharacters(in: CharacterSet.symbols)
    }

    // see https://stackoverflow.com/questions/34751860/get-html-from-wkwebview-in-swift and https://stackoverflow.com/questions/43808304/get-html-element-value-using-wkwebkit-and-swift-3
    public func copyWebContent() {
        webviewEditor.evaluateJavaScript("document.getElementById('MathInput').value") { (html, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard var htmlContent = html as? String else {
                print("MathInput html textarea hasn't been loaded")
                return
            }
            htmlContent = self.removeSymbol(htmlContent)
            // see : copy to pasteboards https://stackoverflow.com/questions/24670290/how-to-copy-text-to-clipboard-pasteboard-with-swift
            NSPasteboard.general().clearContents()
            NSPasteboard.general().setString(htmlContent, forType: NSPasteboardTypeString)
        }
    }
    
    public func pasteWebContent() {
        webviewEditor.evaluateJavaScript("document.getElementById('MathInput').value") { (html, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard var htmlContent = html as? String else {
                print("MathInput html textarea hasn't been loaded")
                return
            }
            htmlContent = self.removeSymbol(htmlContent)
            // see : copy to pasteboards https://stackoverflow.com/questions/24670290/how-to-copy-text-to-clipboard-pasteboard-with-swift
            let content = NSPasteboard.general().string(forType: NSPasteboardTypeString)!
            let newValue = htmlContent + content
            let executedScript = "document.getElementById('MathInput').value='" + newValue + "'"
            self.webviewEditor.evaluateJavaScript(executedScript) { (html, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
            }
        }
    }
    
    public func selectAllWebContent() {
        webviewEditor.evaluateJavaScript("document.getElementById('MathInput').select();") { (html, error) in
            guard error == nil else {
                print(error!)
                return
            }
        }
    }
    
}


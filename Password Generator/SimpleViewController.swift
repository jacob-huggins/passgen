//
//  SimpleViewController.swift
//  Password Generator
//
//  Created by Jacob Huggins on 13/2/18.
//  Copyright © 2018 Jacob Huggins. All rights reserved.
//

import Cocoa
import Alamofire

class SimpleViewController: NSViewController {

    let SimpleURL = Const.AppURL.Simple
    let ExportHeader = Const.Export.CSVHeader
    let ExportName = Const.Export.Name
    let ExportTypes = Const.Export.FileTypes
    let ExportOthers = Const.Export.AllowOtherFileTypes
    
    @IBOutlet weak var labelGenerate: NSTextField!
    @IBOutlet weak var inputExportAmount: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func buttonGenerate(_ sender: Any) {
        Alamofire.request(SimpleURL).responseString { response in
            self.labelGenerate.stringValue = response.result.value!
        }
    }
    
    @IBAction func buttonExport(_ sender: Any) {
        let exportAmount = inputExportAmount.integerValue
        var exportData = ExportHeader
        
        for _ in 1...exportAmount {
            Alamofire.request(SimpleURL).responseString { response in
                exportData += response.result.value! + "\n"
            }
            usleep(50000)
        }
        
        let export = NSSavePanel()
        export.nameFieldStringValue = ExportName
        export.allowedFileTypes = ExportTypes
        export.allowsOtherFileTypes = ExportOthers
        
        export.begin { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                do {
                    try exportData.write(to: export.url!, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    // failed to write file (bad permissions, bad filename etc.)
                }
            }
        }
    }
    
    
}
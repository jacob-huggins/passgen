//
//  ViewController.swift
//  Password Generator
//
//  Created by Jacob Huggins on 12/2/18.
//  Copyright © 2018 Jacob Huggins. All rights reserved.
//

import Cocoa
import Alamofire

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let SimpleURL = "http://www.dinopass.com/password/simple"
        
        Alamofire.request(SimpleURL).responseString { response in
            print(response.result.value!)
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


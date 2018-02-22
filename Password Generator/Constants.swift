//
//  Constants.swift
//  Password Generator
//
//  Created by Jacob Huggins on 13/2/18.
//  Copyright © 2018 Jacob Huggins. All rights reserved.
//

import Foundation

struct Const {
    struct AppURL {
        static let Simple = "http://www.dinopass.com/password/simple"
        static let Strong = "http://www.dinopass.com/password/strong"
    }
    
    struct Export {
        static let CSVHeader = "passwords\n" //For multiple headers - header1,header2,header3\n
        static let Name = "test" //default file name for password export
        static let FileTypes = ["csv"] //comma-seperated file types ["csv","txt"]
        static let AllowOtherFileTypes = false //Do not allow user to change the exported file type
    }
    
    struct Data {
        static let Timer = UInt32(50000) //Timer between dinopass polling to avoid being blocked
    }
}

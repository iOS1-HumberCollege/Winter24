//
//  Contact.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-09.
//

import Foundation
import UIKit

class Contact {
    
    var name: String
    var number : String
    var image: UIImage?
    var location: String
    
    init(name: String, number: String, image: UIImage?, loc: String) {
        self.name = name
        self.number = number
        self.image = image
        self.location = loc
    }

    init(){
        self.name = ""
        self.number = ""
        self.image = nil
        self.location = ""
    }
    
}

//
//  ViewController.swift
//  GOTApplication
//
//  Created by Rania Arbash on 2024-04-12.
//

import UIKit

class ViewController: UIViewController, networkingDelegate {
    func gettingListIsDone(list: [GOTCharacter]) {
        print(list.count)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Networking2Service.shared.delegate = self
        Networking2Service.shared.getListOfGOTCharacters()
//        Networking2Service.shared.getListOfGOTCharacters { list in
//            print(list.count)
//        }
    }


}


//
//  ViewController.swift
//  Week2
//
//  Created by Rania Arbash on 2024-01-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var myfirstname = "Rania"
    var counter = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Winter 24 iOS1"
    }
    override func viewDidAppear(_ animated: Bool) {
        titleLabel.text = "IGS"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = "Humber College"
    }
   

    @IBAction func logInClicked(_ sender: Any) {
       
        titleLabel.text = "Button Clicked \(counter)"
        counter += 1
        titleLabel.isHidden = true
        
    }
   
    
    @IBAction func digitClicked(_ sender: Any) {
        titleLabel.isHidden = false
        var clickedButton = sender as! UIButton
        if let goodTitle =  clickedButton.titleLabel!.text{
            titleLabel.text = "\(titleLabel.text!)\(goodTitle)"
        }
        
//        if (sender as! UIButton){
//            
//        }
    }
    
    
//    @IBAction func twoClicked(_ sender: Any) {
//
//        titleLabel.text = "Two Is Clicked"
//    }
//    
//    @IBAction func oneClicked(_ sender: Any) {
//        titleLabel.isHidden = false
//        titleLabel.text = "One Is Clicked"
//    }
    
    
}


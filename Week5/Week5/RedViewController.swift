//
//  RedViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-16.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var contactInfo: UILabel!
    var appCounter = (UIApplication.shared.delegate as? AppDelegate)!.counter
   
    var isThereContacts = false
    
    @IBOutlet weak var counterText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // appCounter = (UIApplication.shared.delegate as? AppDelegate)!.counter
        counterText.text = "\(appCounter)"
        // Do any additional setup after loading the view.
        
        
        if isThereContacts {
            contactInfo.text = "Lucky You!!... You have many contacts"
        }else {
            contactInfo.text = "Sorry You have no contact yet"
        }
        
        
    }
    
    @IBAction func backToMain(_ sender: Any) {
        
        self.dismiss(animated: true)
       // navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func addOne(_ sender: Any) {
        appCounter += 1
        (UIApplication.shared.delegate as? AppDelegate)!.counter += 1

        counterText.text = "\(appCounter)"
    }
    
    
    @IBAction func subOne(_ sender: Any) {
        appCounter -= 1
        (UIApplication.shared.delegate as? AppDelegate)!.counter -= 1
        counterText.text = "\(appCounter)"

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

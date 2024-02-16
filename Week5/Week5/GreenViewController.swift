//
//  SecondViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-16.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var ContactNumberText: UILabel!
    var numOfContact = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContactNumberText.text = "\(numOfContact)"
        
        // Do any additional setup after loading the view.
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

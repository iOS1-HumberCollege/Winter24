//
//  DetailViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-03-08.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var number: UILabel!
    
    
    @IBOutlet weak var location: UILabel!
    
    
    @IBOutlet weak var contactImage: UIImageView!
    var contact : Contact? 
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = contact?.name
        number.text = contact?.number
        location.text = contact?.location
        contactImage.image = contact?.image
        
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

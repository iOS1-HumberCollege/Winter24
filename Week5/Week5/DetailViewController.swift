//
//  DetailViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-03-08.
//

import UIKit

class DetailViewController: UIViewController , EditingContactDelegate{
  
    
   

    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var number: UILabel!
    
    
    @IBOutlet weak var location: UILabel!
    
    
    @IBOutlet weak var contactImage: UIImageView!
    var contact : Contact? 
    var contactIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = contact?.name
        number.text = contact?.number
        location.text = contact?.location
        contactImage.image = contact?.image
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let EVC =  segue.destination as? EditViewController
        EVC!.delegate = self
        EVC!.contact = contact
    }
    
    
    
    
    func editingContactDidCanceled() {
        
    }
    
    func editingContactDidFinished(updatedContact: Contact) {
     
        name.text = updatedContact.name
        number.text = updatedContact.number
        location.text = updatedContact.location
        contactImage.image = updatedContact.image
        
        (UIApplication.shared.delegate as? AppDelegate)?.allContacts[contactIndex] = updatedContact
    }
}

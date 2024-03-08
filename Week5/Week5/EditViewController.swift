//
//  EditViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-03-08.
//

import UIKit

protocol EditingContactDelegate {
    func editingContactDidFinished(updatedContact : Contact)
    func editingContactDidCanceled()
}


class EditViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var updatedContact = Contact()
    var delegate : EditingContactDelegate?
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var number: UITextField!
    
    
    @IBOutlet weak var location: UITextField!
    
    
    
    var contact : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = contact?.name
        number.text = contact?.number
        location.text = contact?.location
        image.image = contact?.image
        // Do any additional setup after loading the view.
        
        
    }
    

    
    @IBAction func save(_ sender: Any) {
        
        updatedContact.name =  name.text!
        updatedContact.number = number.text!
        updatedContact.location = location.text!
        updatedContact.image = image?.image
        
        delegate?.editingContactDidFinished(updatedContact: updatedContact)
            dismiss(animated: true)
        
    }
    
    
    
    @IBAction func updateTheImage(_ sender: Any) {
    
        let imagePickerController = UIImagePickerController()
        
       imagePickerController.sourceType  = .photoLibrary

//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            imagePickerController.sourceType  = .camera
//        }else{
//            imagePickerController.sourceType  = .photoLibrary
//        }
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        print("One image has been selected")
       
      
        image.image = info[.originalImage] as? UIImage
        updatedContact.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true)
    }

   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("No image has been selected")
        //newcontact.image = nil
        image.image = UIImage(named: "emptyImage")
        dismiss(animated: true)
        
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.editingContactDidCanceled()

        dismiss(animated: true)
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

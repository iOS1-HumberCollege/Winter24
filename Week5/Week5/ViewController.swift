//
//  ViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-09.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var newcontact = Contact()
    
    var localContacts = (UIApplication.shared.delegate as? AppDelegate)?.allContacts
    
    var selectedImage = UIImage(named: "emptyImage")
    
    @IBOutlet weak var contactImg: UIImageView!
    
    @IBOutlet weak var contactTable: UITableView!
    @IBOutlet weak var contactNameText: UITextField!
    
    
    @IBOutlet weak var contactPhoneNumberText: UITextField!
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    override func viewWillAppear(_ animated: Bool) {
        localContacts = (UIApplication.shared.delegate as? AppDelegate)?.allContacts
        contactTable.reloadData()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localContacts!.count // 2
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 3
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? contactTableViewCell
        cell?.nameText.text = localContacts![indexPath.row].name
        cell?.numberText.text = localContacts![indexPath.row].number
        cell?.contactImg.image = localContacts![indexPath.row].image
        cell?.locationText.text = localContacts![indexPath.row].location
        
        
        return cell!
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "green"{
            
            let GVC = segue.destination as? GreenViewController
            GVC?.numOfContact = localContacts!.count
        }
        if segue.identifier == "todetail"{
            let detailVC = segue.destination as? DetailViewController
            let sc = localContacts![contactTable.indexPathForSelectedRow!.row]
            detailVC!.contact = sc
            detailVC!.contactIndex = contactTable.indexPathForSelectedRow!.row
            
            
        }
        else {
           let RVC = segue.destination as? RedViewController
            RVC?.isThereContacts = !localContacts!.isEmpty
        }
        
        
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        if let goodname = contactNameText.text {
            if let goodNum = contactPhoneNumberText.text{
                if (!goodname.isEmpty && !goodNum.isEmpty) {
                    let alert = UIAlertController(title: "Save New Contact", message: "Where you want to save this contact", preferredStyle: .actionSheet)
                    
                    alert.addAction(UIAlertAction(title: "SIM1?", style: .default, handler: { action in
                            ///
                        self.newcontact.name = goodname
                        self.newcontact.number = goodNum
                        self.newcontact.location = "SIM1"
                        self.newcontact.image = self.selectedImage
                        self.localContacts?.append(self.newcontact)

                        (UIApplication.shared.delegate as? AppDelegate)?.allContacts.append(self.newcontact)
                        // update the table // reload
                        self.contactTable.reloadData()
                        self.clearTexts()
                        self.selectedImage = UIImage(named: "emptyImage")
                        
                    }))
                    
                    
                    alert.addAction(UIAlertAction(title: "SIM2?", style: .default, handler: { action in
                            ///
                        self.newcontact.name = goodname
                        self.newcontact.number = goodNum
                        self.newcontact.location = "SIM2"
                        self.newcontact.image = self.selectedImage
                        self.localContacts?.append(self.newcontact)

                        (UIApplication.shared.delegate as? AppDelegate)?.allContacts.append(self.newcontact)
                                               // update the table // reload
                        self.contactTable.reloadData()
                        self.clearTexts()
                        self.selectedImage = UIImage(named: "emptyImage")
                        
                    }))
                    
                    
                    alert.addAction(UIAlertAction(title: "Dismiss?", style: .destructive, handler: { action in
                        self.clearTexts()
                    }))

                    present(alert, animated: true)
                    
                    
                }else {
                    // alert /// you have to enter both values
                    
                    let alert = UIAlertController(title: "Input Error!!", message: "One or more missing Information", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                    present(alert, animated: true)
                    
                }
                
            }else {}
        }else {}
        
        newcontact = Contact()
        contactImg.image = UIImage(named: "emptyImage")
       //
    }
    
    @IBAction func clearClicked(_ sender: Any) {
        clearTexts()
        
    }
    
    
    func clearTexts() {
        contactNameText.text = ""
        contactPhoneNumberText.text = ""
        
    }
    
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//       // performSegue(withIdentifier: "todetail", sender: nil)
//
//            
//        
//        
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        switch (editingStyle){
        case .delete :
            var selectedContact = localContacts?[indexPath.row]
            let alert = UIAlertController(title: "Be Carful?", message: "Are You Sure you want to delete \(selectedContact!.name)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive,handler: { action in
                self.localContacts!.remove(at: indexPath.row)
                (UIApplication.shared.delegate as? AppDelegate)?.allContacts.remove(at: indexPath.row)
                
                self.contactTable.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel))
            
            present(alert, animated: true)
            
            
            
            break;
        case .none: break
        case .insert: break
        @unknown default:
            break;
        }
        
        
        
    }

    
    @IBAction func uploadPhoto(_ sender: Any) {
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
       
      
        selectedImage = info[.originalImage] as? UIImage
        contactImg.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true)
    }

   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("No image has been selected")
        newcontact.image = nil
        selectedImage = UIImage(named: "emptyImage")
        dismiss(animated: true)
        
    }

    
}


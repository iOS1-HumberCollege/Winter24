//
//  ViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-09.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var contactTable: UITableView!
    @IBOutlet weak var contactNameText: UITextField!
    
    
    @IBOutlet weak var contactPhoneNumberText: UITextField!
    
    
 
    var allContacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count // 2
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 3
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = allContacts[indexPath.row].name
        cell?.detailTextLabel?.text = allContacts[indexPath.row].number
        
        
        return cell!
        
    }
    
    
    
    @IBAction func saveClicked(_ sender: Any) {
//        guard <#condition#> else {
//            <#statements#>
//        }
        
        
        
        if let goodname = contactNameText.text {
            if let goodNum = contactPhoneNumberText.text{
                if (!goodname.isEmpty && !goodNum.isEmpty) {
                    let alert = UIAlertController(title: "Save New Contact", message: "Where you want to save this contact", preferredStyle: .actionSheet)
                    
                    alert.addAction(UIAlertAction(title: "SIM1?", style: .default, handler: { action in
                            ///
                        self.allContacts.append(Contact(name: goodname, number: goodNum))
                        // update the table // reload
                        self.contactTable.reloadData()
                        self.clearTexts()
                        
                    }))
                    
                    
                    alert.addAction(UIAlertAction(title: "SIM2?", style: .default, handler: { action in
                            ///
                        self.allContacts.append(Contact(name: goodname, number: goodNum))
                        // update the table // reload
                        self.contactTable.reloadData()
                        self.clearTexts()
                        
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
        
        
        
    }
    
    
    @IBAction func clearClicked(_ sender: Any) {
        clearTexts()
        
    }
    
    
    func clearTexts() {
        contactNameText.text = ""
        contactPhoneNumberText.text = ""
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedContact = allContacts[indexPath.row]
        
        let alert = UIAlertController(title: "Calling Or SMS \(selectedContact.name)?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Call \(selectedContact.name)", style: .default))
        
        alert.addAction(UIAlertAction(title: "Send SMS to \(selectedContact.name)", style: .default))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        
        present(alert, animated: true)
        
        
    }
}


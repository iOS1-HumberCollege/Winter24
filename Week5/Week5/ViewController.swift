//
//  ViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-02-09.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var c1 = Contact(name: "John", number: "1234")
    var c2 = Contact(name: "Mary", number: "887733222")
    var c3 = Contact(name: "Lee", number: "99200293933")

    
    var allContacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        allContacts.append(c1)
        allContacts.append(c2)
        allContacts.append(c3)

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count // 2
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 3
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = allContacts[indexPath.row].name
        cell?.detailTextLabel?.text = allContacts[indexPath.row].number
        
        
        return cell!
        
    }
}


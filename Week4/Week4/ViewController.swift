//
//  ViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-02-02.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var namesTable: UITableView!
    
    var names = ["Rania","John","Mary","Lee"]
    
    var friends = ["Rahi","Smith","Jo"]
    
    @IBOutlet weak var unitsegment: UISegmentedControl!
    
    @IBOutlet weak var titleText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        namesTable.delegate = self
        namesTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0{
            return names.count
        } else {
            return friends.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell?
        if tableView.tag == 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = names[indexPath.row]
        }
        else {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = friends[indexPath.row]
        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        titleText.text = "Hello \(names[indexPath.row])"
    }
    
    
    @IBAction func onUnitChange(_ sender: UISegmentedControl) {
    
        if  sender.selectedSegmentIndex == 0 {
            titleText.text = "cm/kg"
        }else {
            
            titleText.text = "in/lb"
        }
        
    }
    
}


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
    @IBOutlet weak var titleText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = "Hello Week 4"
        namesTable.delegate = self
        namesTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        titleText.text = "Hello \(names[indexPath.row])"
    }
}


//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-15.
//

import UIKit

class CitiesTableViewController: UITableViewController , UISearchBarDelegate , NetworkingCitiesDelegate{
  
    @IBOutlet weak var searchbar: UISearchBar!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        NetworkingService.shared.citiesDelegate = self
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appDelegate?.cityList.count)!
    }
    
    func networkingDidFinishWithListOfCities(list: [String]) {
        appDelegate?.cityList = list
        tableView.reloadData()
    }
    
    func networkingDidFinishWithError() {
        // no cities available
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.count > 2 {
            // First Option - Networking Service with Delegate Protocol
            //NetworkingService.shared.getListOfCities(searchText: searchText)
            
            // Second Option - Networking 2 Service with CompletionHandler
            Networking2Service.shared.getListOfCities(searchText: searchText) { listOfCity in
                    // do the UI update
                DispatchQueue.main.async {
                    self.appDelegate?.cityList = listOfCity
                    self.tableView.reloadData()
                }
            }
            
        }
        if searchText.count == 0 {
            appDelegate?.cityList = []
            tableView.reloadData()
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appDelegate?.cityList[indexPath.row]
        
        return cell
    }
    

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let indext = tableView.indexPathForSelectedRow!.row
        
        let wvc = segue.destination as? WeatherViewController
        wvc?.cityFromFVC = (appDelegate?.cityList[indext])!
        
    }
    

}

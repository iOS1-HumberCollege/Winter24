//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-15.
//

import UIKit

class WeatherViewController: UIViewController , NetworkingWeatherDelegate {
   
    var cityFromFVC : String = ""
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.weatherDelegate = self
        
        
        NetworkingService.shared.getWeatherInCity(fullCityName: cityFromFVC)
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

    
    
    func networkingDidFinishWithWeatherObject(weatherObj: WeatherModel) {
        print(weatherObj.temp)
        print(weatherObj.description)
    }
    
    
    func networkingDidFinishWithError() {
        
    }
}

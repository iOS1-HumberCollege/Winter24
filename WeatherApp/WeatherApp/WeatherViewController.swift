//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-15.
//

import UIKit

class WeatherViewController: UIViewController , NetworkingWeatherDelegate {
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    
    var cityFromFVC : String = ""
  
    @IBOutlet weak var descText: UILabel!
    
    @IBOutlet weak var tempText: UILabel!
    
    @IBOutlet weak var humidityText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.weatherDelegate = self
        loadingIndicator.startAnimating()
        title = "\(cityFromFVC)"
        
        NetworkingService.shared.getWeatherInCity(fullCityName: cityFromFVC)
    }
    


    
    
    func networkingDidFinishWithWeatherObject(weatherObj: WeatherModel) {
        descText.text = weatherObj.description!
        tempText.text = "Temp:  \(String(describing: weatherObj.temp!))"
        humidityText.text = "Humidity: \(String(describing: weatherObj.humidity!))"
        downloadImage(iconValue: weatherObj.icon!)
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
    
    func downloadImage(iconValue: String){
    
        let myQ = DispatchQueue(label: "myQ")
        myQ.async {
            let iconURL = "https://openweathermap.org/img/wn/\(iconValue)@2x.png"
            do{
                let urlObject = URL(string: iconURL)
                if let goodURL = urlObject {
                    let imageData = try Data(contentsOf: goodURL)
                    DispatchQueue.main.async {
                        self.weatherIcon.image = UIImage(data: imageData)
                    }
                }
            }catch {
                print(error)
            }
        }
    }
    func networkingDidFinishWithError() {
        
    }
}

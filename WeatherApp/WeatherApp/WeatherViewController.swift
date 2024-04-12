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
        // First Option - Networking with Protocol
        // NetworkingService.shared.getWeatherInCity(fullCityName: cityFromFVC)
        
        // Second Option - Networking with Complition Handler
        Networking2Service.shared.getWeatherInCity(fullCityName: cityFromFVC) { result in
            switch result{
            case .failure(_): print("There is an error");
                break
            case .success(let WeatherObj):
                DispatchQueue.main.async {
                    self.updateUIWithWeatherData(weatherObj: WeatherObj)
                }
                break
            }
        }
        
    }
    


    
    
    func networkingDidFinishWithWeatherObject(weatherObj: WeatherModel) {
        updateUIWithWeatherData(weatherObj: weatherObj)
    }
    
    func updateUIWithWeatherData(weatherObj: WeatherModel){
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

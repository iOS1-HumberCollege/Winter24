//
//  NetworkingService.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-15.
//

import Foundation

protocol NetworkingCitiesDelegate {
    func networkingDidFinishWithListOfCities(list: [String]);
    func networkingDidFinishWithError();
}

protocol NetworkingWeatherDelegate {
    func networkingDidFinishWithWeatherObject(weatherObj: WeatherModel);
    func networkingDidFinishWithError();
}

class NetworkingService {
    
    static var shared = NetworkingService()
    
    
    var citiesDelegate: NetworkingCitiesDelegate?
    var weatherDelegate: NetworkingWeatherDelegate?

    func getListOfCities(searchText: String){
       
        let urlObj = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q="+searchText)!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if error != nil {
                self.citiesDelegate?.networkingDidFinishWithError()
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                        self.citiesDelegate?.networkingDidFinishWithError()
                        return
                   }
            
            ///
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                // convert json string ===> List of String
                do{
                    let listOfCities = try JSONDecoder().decode([String].self, from: data!)
                    DispatchQueue.main.async {
                        self.citiesDelegate?.networkingDidFinishWithListOfCities(list: listOfCities)
                    }
                    
                }
                catch{
                    print(error)
                    
                }
                
        }
            
            
            
            
        }
        
        task.resume()
        
        
        
        
    }
    
    
    func getWeatherInCity(fullCityName: String){
        let key = "071c3ffca10be01d334505630d2c1a9c"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(fullCityName)&appid=\(key)&units=metric"
        
        let urlObj = URL(string: url)!
         let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
             
             if error != nil {
                 self.weatherDelegate?.networkingDidFinishWithError()
                 return
             }
             guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                        self.weatherDelegate?.networkingDidFinishWithError()
                         return
                    }
             
             ///
             if let jsonString = String(data: data!, encoding: .utf8) {
                 print(jsonString)
                 // convert json string ===> List of String
                 do{
                    var weatherObject = try  JSONDecoder().decode(weatherJsonObject.self, from: data!)
                     
//                     let dic = try JSONSerialization.jsonObject(with: data!) as? NSDictionary
//                     let mainDic = dic!.value(forKey: "main") as? NSDictionary
//                     let temp =  mainDic?.value(forKey: "temp") as? Double
//                     let humidity =  mainDic?.value(forKey: "humidity") as? Int
//                     
//                     let weatherArray = dic?.value(forKey: "weather") as? NSArray
//                     let desc = (weatherArray![0] as? NSDictionary)?.value(forKey: "description") as? String
//                     let icon = (weatherArray![0] as? NSDictionary)?.value(forKey: "icon") as? String
//                     
                     let weatherObj = WeatherModel()
                     weatherObj.description = weatherObject.weather![0].description
                     weatherObj.humidity = weatherObject.main?.humidity
                     weatherObj.icon = weatherObject.weather![0].icon
                     weatherObj.temp = weatherObject.main?.temp
//
//                     let weatherObj = try JSONDecoder().decode(WeatherModel.self, from: data!)
                     
                     DispatchQueue.main.async {
                         self.weatherDelegate?.networkingDidFinishWithWeatherObject(weatherObj: weatherObj)
                     }
                     
                 }
                 catch{
                     print(error)
                     
                 }
                 
         }
             
             
             
             
         }
         
         task.resume()
         
         
        
    }
    
    
    
    
    
}

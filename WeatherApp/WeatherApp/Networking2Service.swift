//
//  Networking2Service.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-22.
//

import Foundation

class Networking2Service {
    
    static var shared = Networking2Service()
    
    func getListOfCities(searchText: String, completiongHandler: @escaping ([String])->Void){
       
        let urlObj = URL(string: "http://gd.geobytes.com/AutoCompleteCity?&q="+searchText)!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if error != nil {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                return
                   }
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                // convert json string ===> List of String
                do{
                    let listOfCities = try JSONDecoder().decode([String].self, from: data!)
                    completiongHandler(listOfCities)
                    
                }
                catch{
                    print(error)
                    
                }
                
        }
        }
        
        task.resume()
    }
    
    
    func getWeatherInCity(fullCityName: String, complitionHandler :@escaping (Result<WeatherModel,Error>)->Void){
        let key = "071c3ffca10be01d334505630d2c1a9c"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(fullCityName)&appid=\(key)&units=metric"
        
//        var request = URLRequest(url: URL(string: ""))
//        request.addValue(<#T##String#>, forHTTPHeaderField: "symbol_set")
//        
       // URLSession.shared.dataTask(with: URLRequest)
        
        let urlObj = URL(string: url)!
         let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
             
             if error != nil {
                 complitionHandler(.failure(error!))
                 return
             }
             guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                
                 complitionHandler(.failure(error!))
                 return
                    }
             
             ///
             if let jsonString = String(data: data!, encoding: .utf8) {
                 print(jsonString)
                 // convert json string ===> List of String
                 do{
                     let weatherObject = try  JSONDecoder().decode(weatherJsonObject.self, from: data!)
                     
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

                     complitionHandler(.success(weatherObj))
                     
                     
                 }
                 catch{
                     print(error)
                     
                 }
                 
         }
         }
         
         task.resume()
    }
    
    
    
    
    
}

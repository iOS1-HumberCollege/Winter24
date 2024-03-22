//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-03-15.
//

import Foundation


class WeatherModel : Decodable {
    var temp : Double?
    var description : String?
    var icon: String?
    var humidity: Int?
}



class weatherJsonObject : Decodable {
    var coord: location?
    var main : mainWeatherClass?
    var weather : [weatherDescriptionClass]?
    var visibility: Int?
}

class mainWeatherClass : Decodable {
    var temp : Double = 0
    var  feels_like : Double = 0
    var humidity : Int = 0
}

class weatherDescriptionClass : Decodable {
    var description : String = ""
    var icon : String = ""
}

class location : Decodable{
    
    var lon: Double = 0
    var lat: Double = 0
}

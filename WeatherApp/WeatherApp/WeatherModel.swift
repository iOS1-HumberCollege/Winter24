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




//
//  Weather.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation


struct WeatherConditions: Codable {
    let description: String
}

struct MainConditions: Codable {
    typealias Temperature = Double
    let temp: Temperature
    let humidity: Int
}

struct WeatherResponse: Codable {
    let weather: [WeatherConditions]
    let main: MainConditions
    let name: String
}

enum APIError: Error {
    case noAnyData
}

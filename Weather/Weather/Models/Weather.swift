//
//  Weather.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation

struct WeatherConditions: Codable {
    let description: String
    let icon: String
}

struct MainConditions: Codable {
    typealias Temperature = Double
    let temp: Temperature
    let feels_like: Temperature
    let temp_min: Temperature
    let temp_max: Temperature
    let humidity: Int
}

struct WeatherResponse: Codable {
    let weather: [WeatherConditions]
    let main: MainConditions
    let name: String
}

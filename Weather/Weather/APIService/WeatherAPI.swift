//
//  WeatherAPI.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import Foundation

enum WeatherAPIError: Error {
    case genericError
}


class WeatherAPI {
    
    private let baseUrl = "api.openweathermap.org/data/2.5/"
    private let appid = "0058adaff3893eb760cbbf2c877c6e7d"
    
    func requestWeather(city: String, completionHandler: ((Result<WeatherResponse, Error>) -> Void)?) {
        let parameters = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "lang", value: "eng"),
            URLQueryItem(name: "units", value: "metric")
        ]
        guard let weatherURL = makeUrl("weather", parameter: parameters) else { return }
        
        var request = URLRequest(url: weatherURL)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let data = data,
               let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                
                DispatchQueue.main.async {
                    completionHandler?(.success(weatherResponse))
                }
            }
            else {
                completionHandler?(.failure(WeatherAPIError.genericError))
            }
        }
        task.resume()
    }
    
    private func makeUrl(_ method: String, parameter: [URLQueryItem]) -> URL? {
        
        var component = URLComponents()
        component.scheme = "https"
        component.path = baseUrl + method
        
        var queryItems = [
            URLQueryItem(name: "appid", value: appid)
        ]
        queryItems.append(contentsOf: parameter)
        
        component.queryItems = queryItems
        return component.url
    }
}

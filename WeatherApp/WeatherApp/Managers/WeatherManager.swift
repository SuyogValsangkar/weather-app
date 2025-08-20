//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by suva on 8/19/25.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        let API_KEY: String = "387d88b0716b41a8b8871606251908"
        let API_CALL: String = "https://api.weatherapi.com/v1/current.json?key=\(API_KEY)&q=\(latitude),\(longitude)"
        
        guard let url = URL(string: API_CALL) else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}


struct ResponseBody: Decodable {
    let location: Location
    let current: Current
    
    struct Location: Decodable {
        let name: String
        let region: String
        let country: String
        let lat: Double
        let lon: Double
        let tz_id: String
        let localtime_epoch: Int
        let localtime: String
    }
    
    struct Current: Decodable {
        let last_updated_epoch: Int
        let last_updated: String
        let temp_c: Double
        let temp_f: Double
        let is_day: Int
        let condition: Condition
        let wind_mph: Double
        let wind_kph: Double
        let wind_degree: Int
        let wind_dir: String
        let pressure_mb: Double
        let pressure_in: Double
        let precip_mm: Double
        let precip_in: Double
        let humidity: Int
        let cloud: Int
        let feelslike_c: Double
        let feelslike_f: Double
        let windchill_c: Double
        let windchill_f: Double
        let heatindex_c: Double
        let heatindex_f: Double
        let dewpoint_c: Double
        let dewpoint_f: Double
        let vis_km: Double
        let vis_miles: Double
        let uv: Double
        let gust_mph: Double
        let gust_kph: Double
        let short_rad: Int
        let diff_rad: Int
        let dni: Int
        let gti: Int
    }
    
    struct Condition: Decodable {
        let text: String
        let icon: String
        let code: Int
    }
}


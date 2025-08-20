//
//  WeatherView.swift
//  WeatherApp
//
//  Created by suva on 8/20/25.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.location.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 40))
                            
                            Text(weather.current.condition.text)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.current.temp_f.roundDouble() + "°")
                            .font(.system(size: 80))
                            .bold()
                            .padding()
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .font(.system(size: 20))
                            .bold()
                        
                        HStack {
                            WeatherRow(logo: "thermometer.variable", name: "Feels Like (F°)", value: weather.current.feelslike_f.roundDouble() + "°")
                            
                            Spacer()
                            
                            WeatherRow(logo: "humidity.fill", name: "Humidity", value: "\(weather.current.humidity)")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        
                        HStack {
                            WeatherRow(logo: "thermometer.variable", name: "UV Index", value: "\(weather.current.uv)")
                            
                            Spacer()
                            
                            WeatherRow(logo: "cloud.rain.fill", name: "Rain (in.)", value: "\(weather.current.precip_in)")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }

            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}

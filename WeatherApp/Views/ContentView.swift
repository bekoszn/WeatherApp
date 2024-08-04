//
//  ContentView.swift
//  WeatherApp
//
//  Created by Berke Özgüder on 2.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Hava durumunu alırken hata oluştu: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(.purple))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

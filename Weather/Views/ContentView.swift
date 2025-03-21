//
//  ContentView.swift
//  Weather
//
//  Created by Виктория Мирошник on 18.03.2025.
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
                    Text("Succes")
                }
                else{
                    ProgressView().task {
                        do {
                            try await
                            weather = WeatherManager().getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            
                        } catch { print("\(error)") }
                    }
                }
            }
            else {
                if locationManager.isLoading == true {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
    
        }
        .padding()
        .background(Color(hue: 0.584, saturation: 0.935, brightness: 0.655))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

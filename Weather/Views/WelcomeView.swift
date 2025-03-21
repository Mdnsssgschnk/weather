//
//  WelcomeView.swift
//  Weather
//
//  Created by Виктория Мирошник on 19.03.2025.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App").font(.title).bold()
                
                Text("Please share your location").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareMyCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(25)
            .foregroundStyle(Color(.white))
            .symbolVariant(.fill)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView().environmentObject(LocationManager())
}

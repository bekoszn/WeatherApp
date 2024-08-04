//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Berke Özgüder on 2.08.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Hava Durumu Uygulamasına Hoş Geldiniz")
                    .bold().font(.title)
                Text("Lütfen nerede olduğunuzu anlayabilmek için lokasyonunuzu paylaşın")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}

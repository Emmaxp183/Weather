//
//  WelcomeView.swift
//  Weather
//
//  Created by macbook on 04/05/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    //PROPERTIES
    
    @EnvironmentObject var locationManager : LocationManager
   
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)

                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
           
            LocationButton(.shareCurrentLocation){
               
                locationManager.requestLocation()
                    
            }.cornerRadius(10).foregroundColor(.white).symbolVariant(.fill)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//
//  ContentView.swift
//  Weather
//
//  Created by macbook on 03/05/2022.
//

import SwiftUI

struct ContentView: View {
    //PROPERTIES
    
    //instance of the weather manager
    var weatherManager = WeatherManager()
   
    @State var weather : ResponseBody?
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
           
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
            VStack{
                    if let location = locationManager.location {
                        
                        if let weather = weather {
                            
                            WeatherView(weather : weather)
                        
                        
                        }else{
                           
                            
                            LoadingView()
                                .task {
                                    do {
                                      weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                    } catch  {
                                        print("Error getting Weather\(error)")
                                    }
                                }
                        }
                   
                    
                    
                    
                    }else{
                         if locationManager.isLoading{
                           
                             LoadingView()
                             
                         }else{
                            
                             
                             WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }
                }
        //         .background (Color(hue: 0.656, saturation: 0.787,brightness: 0.354))
            .preferredColorScheme (.dark)
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( )
    }
}

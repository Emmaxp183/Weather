//
//  WeatherView.swift
//  Weather
//
//  Created by macbook on 06/05/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            
            VStack{
                
                VStack(alignment: .leading, spacing: 5){
                    
                    
               
                }
                .frame (maxWidth: .infinity, alignment:
                        .leading)
                
                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewweather)
    }
}

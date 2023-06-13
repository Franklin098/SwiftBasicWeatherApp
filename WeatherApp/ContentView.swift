//
//  ContentView.swift
//  WeatherApp
//
//  Created by Franklin Velásquez on 9/06/23.
//

import SwiftUI

// Structs are value types, they don't hold state, they are created and destroyed all the time
struct ContentView: View {
    
    // The state data persists during re-renders (creation and destroy of the view)
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight:isNight)

            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sunset.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 82)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 72)
                    
                    WeatherDayView(dayOfWeek: "SA",
                                   imageName: "snow",
                                   temperature: 34)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing:1){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                                    isNight ? [.black, .gray]
                                            : [.blue, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        // Every modifier wraps the view in a NEW view ->  The Order matters!
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top)
           // .background(Color.red)
           // .frame(width: 200,height: 200) // the frame is after the background color
    }
}

struct MainWeatherStatusView: View {
    
    var imageName:String
    var temperature:Int
    
    
    var body: some View {
        VStack (spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit) // keeps the aspect ratio
                .frame(width: 180, height: 180) // try by error for the values, experience
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


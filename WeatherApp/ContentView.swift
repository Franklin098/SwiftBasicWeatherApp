//
//  ContentView.swift
//  WeatherApp
//
//  Created by Franklin Velásquez on 9/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                // Every modifier wraps the view in a NEW view ->  The Order matters!
                Text("Cupertino, CA")
                    .font(.system(size: 32,weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top)
                   // .background(Color.red)
                   // .frame(width: 200,height: 200) // the frame is after the background color
                
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit) // keeps the aspect ratio
                        .frame(width: 180, height: 180) // try by error for the values, experience
                    
                    Text("76°")
                    
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

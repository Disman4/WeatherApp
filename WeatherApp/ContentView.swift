//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tanaka Mawoyo on 31.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: .lightBlue)

            VStack{
                CityTextView(cityName: "Cupertino, CA")

                MainStatusView(imageName: "cloud.sun.fill",
                               temperature: 23)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   Temperature: 23)

                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.fill",
                                   Temperature: 20)

                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "sun.max.fill",
                                   Temperature: 27)

                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "wind",
                                   Temperature: 18)

                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.bolt.rain.fill",
                                   Temperature: 15)

                }

                Spacer()

                Button {
                    print("button tapped")
                }
                label: {
                    Text("change day time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20,
                                      weight: .bold,
                                      design: .default))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 20,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20,
                                topTrailingRadius: 20
                            )
                        )
                }

                Spacer()

            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var Temperature: Int



    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(Temperature)˚")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color

    var body: some View {

        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {

    var cityName: String

    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(Color.white)
            .padding()
    }
}

struct MainStatusView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)˚")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

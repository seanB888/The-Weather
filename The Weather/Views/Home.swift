//
//  Home.swift
//  The Weather
//
//  Created by SEAN BLAKE on 4/3/22.
//

import SwiftUI

struct Home: View {
    @State var offset: CGFloat = 0
    var topEdge: CGFloat

    var body: some View {
        ZStack {
            // Using geometryReader to measure width and height of screen...
            GeometryReader { proxy in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            // add blur to the image
            .overlay(.ultraThinMaterial)

            // MARK: -Main View
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // the weather data...
                    VStack(alignment: .center, spacing: 5) {
                        Text("Fort Lauderdale")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .shadow(radius: 5)

                        Text("98˚")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())

                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())

                        Text("H:103˚ L:105˚")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
                    // for bottom drag effect...
                    .offset(y: offset >  0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())

                    // custom data view...
                    VStack(spacing: 8) {

                        // Custom stack...
                        CustomStackView {
                            // the label here...
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }
                        } contentView: {
                            // Content...
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {

                                    ForecastView(time: "12 PM", celcius: 94, image: "sun.haze")

                                    ForecastView(time: "1 PM", celcius: 90, image: "sun.min")

                                    ForecastView(time: "2 PM", celcius: 93, image: "sun.min")

                                    ForecastView(time: "3 PM", celcius: 97, image: "cloud.sun")

                                    ForecastView(time: "4 PM", celcius: 99, image: "sun.haze")

                                }
                            }
                        }

                        WeatherDataView()

                    }
                }
                .padding(.top, 25)
                .padding([.horizontal, .bottom])
                // getting offset...
                .overlay(
                    // using geometry reader...
                    GeometryReader { proxy -> Color in

                        let minY = proxy.frame(in: .global).minY

                        DispatchQueue.main.async {
                            self.offset = minY
                        }

                        return Color.clear
                    }
                )
            }
        }
    }

    func getTitleOpacity()-> CGFloat {

        let titleOffset = -getTitleOffset()

        let progress = titleOffset / 20

        let opacity = 1 - progress

        return opacity
    }

    func getTitleOffset()-> CGFloat {
        // setting one max height for whole title...
        // consider max as 120...
        if offset < 0 {
            let progress = -offset / 120

            // since top padding is 25...
            let newOffset = (progress <= 1.0 ? progress : 1) * 20

            return -newOffset
        }

        return 0
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Photo by <a href="https://unsplash.com/@sjobjio?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">SJ Objio</a> on <a href="https://unsplash.com/s/photos/backgrounds?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
//

struct ForecastView: View {
    var time: String
    var celcius: CGFloat
    var image: String

    var body: some View {
        VStack(spacing: 15) {
            Text(time)
                .font(.callout.bold())
                .foregroundColor(.white)

            Image(systemName: image)
                .font(.title2)
            // multicolor...
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
            // max height...
                .frame(height: 30)

            Text("\(Int(celcius))")
                .font(.callout.bold())
                .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
    }
}

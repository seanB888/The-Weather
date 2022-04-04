//
//  ContentView.swift
//  The Weather
//
//  Created by SEAN BLAKE on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        // Since Window is Decrepted in iOS15...
        // Getting safe area using Geometry Reader...
        GeometryReader { proxy in

            let topEdge =  proxy.safeAreaInsets.top

            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

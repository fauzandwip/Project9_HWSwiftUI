//
//  ContentView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 11/06/23.
//

import SwiftUI

struct ContentView: View {
    private let topics = [
        NamedView(name: "Introduction", view: MainView()),
        NamedView(name: "Challenges 1 - 2", view: ArrowView()),
        NamedView(name: "Challenge 3", view: ColorCyclingRectangleView()),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<topics.count, id: \.self) { i in
                    NavigationLink(destination: topics[i].view) {
                        Text(topics[i].name)
                    }
                }
            }
            .navigationTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

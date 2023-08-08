//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 12/06/23.
//

import SwiftUI

struct MultiplyBlend: View {
    var body: some View {
        ZStack {
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(.red)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 400)
    }
}

struct ScreenEffect: View {
    @State private var amount = 0.8
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(CGSize(width: -50, height: -80))
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(CGSize(width: 50, height: -80))
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct BlurSaturation: View {
    @State private var amount = 0.8
    
    var body: some View {
        VStack {
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffectsView: View {
    @State private var selectedView = 0
    
    private let views = ["MultiplyBlend", "Screen", "BlurSaturation"]
    
    var body: some View {
        VStack {
            Picker("Effect", selection: $selectedView) {
                ForEach(0..<views.count, id: \.self) { i in
                    Text(views[i])
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
            
            if selectedView == 0 {
                MultiplyBlend()
            } else if selectedView == 1 {
                ScreenEffect()
            } else {
                BlurSaturation()
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}

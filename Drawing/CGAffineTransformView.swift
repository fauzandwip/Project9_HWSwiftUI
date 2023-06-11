//
//  CGAffineTransformView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 11/06/23.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    // How wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for angle in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: angle)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.midX, y: rect.midY))
            
            // for portait and landscape
            var petalHeight: CGFloat
            petalHeight = rect.width < rect.height ? rect.midX : rect.midY
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: petalHeight))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
//            let rotatedPetal = originalPetal.applying(rotation)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}


struct CGAffineTransformView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.mint, style: FillStyle(eoFill: true))
//                .stroke(.blue)
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding(.bottom)
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
        }
        .padding(50)
    }
}

struct CGAffineTransformView_Previews: PreviewProvider {
    static var previews: some View {
        CGAffineTransformView()
    }
}

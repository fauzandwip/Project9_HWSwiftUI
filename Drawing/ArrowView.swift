//
//  ArrowView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 12/06/23.
//

import SwiftUI


// MARK: - Challenge 1

struct Arrow: Shape {
    var rectangleWidth: CGFloat = 50
    var triangleBase: CGFloat = 150
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // triangle
        path.move(to: CGPoint(x: rect.minX + (triangleBase / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - (triangleBase / 2), y: rect.midY))
        
        //rectangle
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - (triangleBase / 2), y: rect.midY))
        
        return path
    }
}

struct ArrowView: View {
    var body: some View {
        VStack {
            Arrow()
                .stroke(.blue, lineWidth: 2)
                .frame(width: 300, height: 300)
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}

//
//  ShapeView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 11/06/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var shape = Path()
        
        shape.move(to: CGPoint(x: rect.midX, y: rect.minY))
        shape.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        shape.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        shape.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return shape
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: startAngle, endAngle: endAngle, clockwise: !clockWise)
        
        return path
    }
    
    // to add strokeBorder
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ShapeView: View {
    var body: some View {
//        Triangle()
//            .fill(.mint)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
        
        Arc(startAngle: .degrees(360), endAngle: .degrees(0), clockWise: true)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .strokeBorder(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}

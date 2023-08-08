//
//  StrokeBorderSupport.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 22/06/23.
//

import SwiftUI

struct Arc2: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        // paul hudson logic
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
        
        // my logic
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

struct StrokeBorderSupport: View {
    var body: some View {
        VStack {
            Arc2(startAngle: .degrees(0), endAngle: .degrees(90), clockWise: true)
                .strokeBorder(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
        }
    }
}

struct StrokeBorderSupport_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderSupport()
    }
}

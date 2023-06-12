//
//  ArrowView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 12/06/23.
//

import SwiftUI


// MARK: - Challenge 1

struct Arrow: InsettableShape {
    var rectangleWidth: CGFloat = 50
    var triangleBase: CGFloat = 150
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // triangle
        path.move(to: CGPoint(x: rect.minX + (triangleBase / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + insetAmount))
        path.addLine(to: CGPoint(x: rect.maxX - (triangleBase / 2), y: rect.midY))
        
        //rectangle
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + (rectangleWidth / 2), y: rect.maxY - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.maxY - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX - (rectangleWidth / 2), y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - (triangleBase / 2), y: rect.midY))
        
        path.closeSubpath()
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ArrowView: View {
    @State private var thickness: CGFloat = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Arrow()
                .strokeBorder(.blue, lineWidth: thickness)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            
            // MARK: - Challenge 2
            
            Button("Thickness") {
                withAnimation {
                    thickness = thickness == 1 ? 10 : 1
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}

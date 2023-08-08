//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 12/06/23.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: 300, height: 300)
                        .border(ImagePaint(image: Image("airport"),sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 1), scale: 0.1), width: 30)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("airport"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 300)
        }
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}

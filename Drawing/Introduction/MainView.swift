//
//  MainView.swift
//  Drawing
//
//  Created by Fauzan Dwi Prasetyo on 22/06/23.
//

import SwiftUI

struct NamedView {
    var name: String
    var view: AnyView
    
    init<V>(name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}
struct MainView: View {
    private var topics = [
        NamedView(name: "Creating custom paths with SwiftUI", view: CustomPaths()),
        NamedView(name: "Paths vs Shapes in SwiftUI", view: PathsVsShapes()),
        NamedView(name: "Adding strokeBorder() support with InsettableShape", view: StrokeBorderSupport()),
        NamedView(name: "Transforming shapes using CGAffineTransform and even-odd fills", view: CGAffineTransformView()),
        NamedView(name: "Creative borders and fills using ImagePaint", view: ImagePaintView()),
        NamedView(name: "Enabling high-performance Metal rendering with drawingGroup()", view: drawingGroupView()),
        NamedView(name: "Special effects in SwiftUI: blurs, blending, and more", view: SpecialEffectsView()),
        NamedView(name: "Animating simple shapes with animatableData", view: AnimatableDataView()),
        NamedView(name: "Animating complex shapes with AnimatablePair", view: AnimatablePairView()),
        NamedView(name: "Creating a spirograph with SwiftUI", view: SpirographView()),
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
            .navigationTitle("Introduction")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

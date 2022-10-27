//
//  ScrollViewEffects.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 19/04/2022.
//

import SwiftUI

/*
 When we use the frame(in:) method of a GeometryProxy, SwiftUI will calculate the view’s current position in the coordinate space we ask for. However, as the view moves those values will change, and SwiftUI will automatically make sure GeometryReader stays updated.
 
 Previously we used DragGesture to store a width and height as an @State property, because it allowed us to adjust other properties based on the drag amount to create neat effects. However, with GeometryReader we can grab values from a view’s environment dynamically, feeding in its absolute or relative position into various modifiers. Even better, you can nest geometry readers if needed, so that one can read the geometry for a higher-up view and the other can read the geometry for something further down the tree.
 
 To try some effects with GeometryReader, we could create a spinning helix effect by creating 50 text views in a vertical scroll view, each of which an infinite maximum width so they take up all the screen space, then apply a 3D rotation effect based on their own position.
 */

struct ScrollViewEffects: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                        //When you run that back you’ll see that text views at the bottom of the screen are flipped, those at the center are rotated about 90 degrees, and those at the very top are normal. More importantly, as you scroll around they all rotate as you move in the scroll view.
                            //.rotation3DEffect(.degrees(geo.frame(in: .global).minY / 5), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ScrollViewEffects_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewEffects()
    }
}

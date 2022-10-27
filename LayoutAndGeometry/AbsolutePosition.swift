//
//  AbsolutePosition.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

// SwiftUI gives us two ways of positioning views: absolute positions using position(), and relative positions using offset(). They might seem similar, but once you understand how SwiftUI places views inside frames the underlying differences between position() and offset() become clearer.

struct AbsolutePosition: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // Without '.position' SwiftUI offers the full available space to ContentView, which in turn passes it on to the text view. The text view automatically uses only as much as space as its text needs, so it passes that back up to ContentView, which is always and exactly the same size as its body (so it directly fits around the text). As a result, SwiftUI centers ContentView in the available space, which from a user’s perspective is what places the text in the center.
            .background(.yellow) // placing a background here only covers the background area relevant to the Child (Text) area
        // now, using '.position' means that Text is placed at a specific coordinate:
            .position(x: 100, y: 100)
        // it also means that the entity: Text(..).position(...) is requiring the full space that it is being proposed by its parent, and so then applying a background .... :
            .background(.mint) // will color the full screen (safe area)
        // (it also colors the edge area because of a material leak at the edge border)

    }
    /*
     To understand what’s happening here you need to remember the three step layout process of SwiftUI:

         A parent view proposes a size for its child.
         Based on that information, the child then chooses its own size and the parent must respect that choice.
         The parent then positions the child in its coordinate space.
     
     So, the parent is responsible for positioning the child, not the child. This causes a problem, because we’ve just told our text view to be at an exact position – how can SwiftUI resolve this?

     The answer to this is also why our background() color made the whole safe area red: when we use position() we get back a new view that takes up all available space, so it can position its child (the text) at the correct location.

     When we use text, position, then background the position will take up all available space so it can position its text correctly, then the background will use that size for itself. When we use text, background, then position, the background will use the text size for its size, then the position will take up all available space and place the background in the correct location.

     */
}

struct AbsolutePosition_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePosition()
    }
}

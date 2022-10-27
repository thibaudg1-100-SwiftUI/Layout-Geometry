//
//  FrameResizable.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct FrameResizable: View {
    /*
     The second interesting side effect is one we faced earlier: if we use frame() on an image that isn’t resizable, we get a larger frame without the image inside changing size. This might have been confusing before, but it makes absolute sense once you think about the frame as being the parent of the image:

         ContentView offers the frame the whole screen.
         The frame reports back that it wants 300x300.
         The frame then asks the image inside it what size it wants.
         The image, not being resizable, reports back a fixed size of 64x64 (for example).
         The frame then positions that image in the center of itself.

     */
    var body: some View {
        Image("64")
            .border(.red)
            .frame(width: 300, height: 300)
        
        /*
         When you listen to Apple’s own SwiftUI engineers talk about modifiers, you’ll hear them refer them to as views – “the frame view”, “the background view”, and so on. I think that’s a great mental model to help understand exactly what’s going on: applying modifiers creates new views rather than just modifying existing views in-place.
         */
    }
}

struct FrameResizable_Previews: PreviewProvider {
    static var previews: some View {
        FrameResizable()
    }
}

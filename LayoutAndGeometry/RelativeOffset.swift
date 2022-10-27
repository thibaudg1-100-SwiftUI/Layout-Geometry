//
//  RelativeOffset.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct RelativeOffset: View {
    var body: some View {
        // When discussing the offset() modifier earlier, I said “if you offset some text its original dimensions don’t actually change, even though the resulting view is rendered in a different location.” With that in mind, try running this code:
        
        Text("Hello, world!")
            .border(.mint)
            .offset(x: 100, y: 100) // this renders Text.border visually somewhere else
            .background(.red) // But officialy from a Layout point of view the Text.border is still at its default position, and so the red background applies to that position
        
        // When we use the offset() modifier, we’re changing the location where a view should be rendered without actually changing its underlying geometry. This means when we apply background() afterwards it uses the original position of the text, not its offset. If you move the modifier order so that background() comes before offset() then things work more like you might have expected, showing once again that modifier order matters.
    }
}

struct RelativeOffset_Previews: PreviewProvider {
    static var previews: some View {
        RelativeOffset()
    }
}

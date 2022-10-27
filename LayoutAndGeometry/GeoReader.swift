//
//  GeoReader.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 19/04/2022.
//

import SwiftUI

struct GeoReader: View {
    var body: some View {
        VStack {
        // GeometryReader has a flexible preferred size that makes it expand to as much space as it's possible
            GeometryReader { geoProxy in // That geo proxy that comes in is a GeometryProxy, and it contains the proposed size, any safe area insets that have been applied, plus a method for reading frame values that we’ll look at in a moment.
                Text("Hello, world!")
                    .frame(width: geoProxy.size.width * 0.9)
                    .background(.red)
            }
            .background(.green) // too show how flexible the georeader container is: will take all the space available while complying with the content around it
            // This is a preferred size, not an absolute size, which means it’s still flexible depending on its parent
            
            Text("more text")
                .background(.blue) // again the blue color leaks in the unsafe area for some reason
        }
    }
}

struct GeoReader_Previews: PreviewProvider {
    static var previews: some View {
        GeoReader()
    }
}

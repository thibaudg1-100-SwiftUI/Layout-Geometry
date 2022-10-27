//
//  AlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

/*
 When that runs you’ll see the VStack sits tightly around its two text views with a red background. The two text views have different lengths, but because we used the .leading alignment they will both be aligned to their left edge in a left-to-right environment. Outside of that there’s a larger frame that has a blue background. Because the frame is larger than the VStack, the VStack is centered in the middle.
 
 Now, when the VStack comes to aligning each of those text views, it asks them to provide their leading edge. By default this is obvious: it uses either the left or right edge of the view, depending on the system language. But what if we wanted to change that – what if we wanted to make one view have a custom alignment?
 
 SwiftUI provides us with the alignmentGuide() modifier for just this purpose. This takes two parameters: the guide we want to change, and a closure that returns a new alignment. The closure is given a ViewDimensions object that contains the width and height of its view, along with the ability to read its various edges.
 */

struct AlignmentGuides: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hello, world!")
                // By default, the .leading alignment guide for a view is its leading alignment guide – I know that sounds obvious, but its effectively equivalent to this:
                //                .alignmentGuide(.leading) { viewDim in
                //                    viewDim[.leading]
                //                }
                // We could rewrite that alignment guide to use the view’s trailing edge for its leading alignment guide, like this:
                    .alignmentGuide(.leading) { viewDim in
                        viewDim[.trailing]
                    }
                //And now you’ll see why I added colors: the first text view will move to the left so that its right edge sits directly above the left edge of the view below, the VStack will expand to contain it, and the whole thing will still be centered within the blue frame.
                
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 300)
            .background(.blue)
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                // This result is different from using the offset() modifier: if you offset a text its original dimensions don’t actually change, even though the resulting view is rendered in a different location. If we had offset the first text view rather than changing its alignment guide, the VStack wouldn’t expand to contain it.
                    .offset(x: -100, y: 0)
                
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 300)
            .background(.blue)
        }
    }
}

struct AlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuides()
    }
}

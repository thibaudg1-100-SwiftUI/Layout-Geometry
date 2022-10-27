//
//  StackAlignment.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct StackAlignment: View {
    var body: some View {
        VStack {
            // We haven’t specified an alignment there, so they will be centered by default. That doesn’t look great, so you might think to align them all to one edge to get a neater line, like this:
            HStack(alignment: .bottom) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            // However, that also looks bad: because each of the text views has a different size, they also have a different baseline – that’s the name for where letters such as “abcde” sit on a line, which excludes letters that go below the line such as “gjpy”. As a result, the bottom of the small text sits lower than the bottom of the bigger text.
            
            Spacer().frame(height: 100)
            
            // Fortunately, SwiftUI has two special alignments that align text on the baseline of either the first child or the last child. This will cause all views in a stack to be aligned on a single unified baseline, regardless of their font:
            
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
        }
    }
}

struct StackAlignment_Previews: PreviewProvider {
    static var previews: some View {
        StackAlignment()
    }
}

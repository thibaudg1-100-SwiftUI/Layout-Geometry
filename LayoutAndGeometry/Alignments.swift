//
//  Alignments.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct Alignments: View {
    var body: some View {
        Text("Live long and prosper").border(.red)
        // The simplest alignment option is to use the alignment parameter of a frame() modifier. Remember, a text view always uses the exact width and height required to show its text, but when we place a frame around it that can be any size. As the parent doesn’t have a say in the final size of the child, code like this will create a 300x300 frame with a smaller text view centered inside it:
//            .frame(width: 300, height: 300)
        
        // If you don’t want the text to be centered, use the alignment parameter of the frame(). For example, this code places the view in the top-left corner when running on a left-to-right environment:
            .frame(width: 300, height: 300, alignment: .topLeading)
        
        // You can then use offset(x:y:) to move the text around inside that frame:
            .offset(x: 50, y: 50)
        // '.frame' being layout neutral, '.offset' will apply to the child of .frame, not .frame itself
    }
}

struct Alignments_Previews: PreviewProvider {
    static var previews: some View {
        Alignments()
    }
}

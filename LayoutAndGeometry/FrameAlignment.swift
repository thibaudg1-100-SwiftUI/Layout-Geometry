//
//  FrameAlignment.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct FrameAlignment: View {
    var body: some View {
        Text("Hello world!")
            .font(.largeTitle) // if text is tall, it leaks out of its parent frame
            .border(.green)
            .frame(width: 200, height: 30, alignment: .topLeading)
            .border(Color.red)
    }
}

struct FrameAlignment_Previews: PreviewProvider {
    static var previews: some View {
        FrameAlignment()
    }
}

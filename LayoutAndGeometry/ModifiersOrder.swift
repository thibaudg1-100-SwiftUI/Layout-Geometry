//
//  ModifiersOrder.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct ModifiersOrder: View {
    /*
     So, when we say Text("Hello, World!").background(.red), the text view becomes a child of its background. SwiftUI effectively works its way from bottom to top when it comes to a view and its modifiers.

     Now consider this layout:
     */
    var body: some View {
        Text("Hello, World!")
            .padding(20)
            .background(.red)
        /*
         This time the conversation is more complicated: padding() no longer offers all its space to its child, because it needs to subtract 20 points from each side to make sure there’s enough space for the padding. Then, when the answer comes back from the text view, padding() adds 20 points on each side to pad it out, as requested.

         So, it’s more like this:

             SwiftUI: You can have the whole screen, how much of it do you need, ContentView?
             ContentView: You can have the whole screen, how much of it do you need, background?
             Background: You can have the whole screen, how much of it do you need, padding?
             Padding: You can have the whole screen minus 20 points on each side, how much of it do you need, text?
             Text: I need X by Y.
             Padding: I need X by Y plus 20 points on each side.
             Background: I need X by Y plus 20 points on each side.
             ContentView: I need X by Y plus 20 points on each side.
             SwiftUI: OK; I’ll center you.

         */
    }
}

struct ModifiersOrder_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersOrder()
    }
}

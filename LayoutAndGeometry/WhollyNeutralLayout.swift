//
//  WhollyNeutralLayout.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct WhollyNeutralLayout: View {
    /*
     There are two interesting side effects that come as a result of these layout rules.
     
     First, if your view hierarchy is wholly layout neutral, then it will automatically take up all available space. For example, shapes and colors are layout neutral, so if your view contains a color and nothing else it will automatically fill the screen like this:
     */
    var body: some View {
        Color.red
        /*
         Remember, Color.red is a view in its own right, but because it is layout neutral it can be drawn at any size. When we used it inside background() the abridged layout conversation worked like this:
         
         Background: Hey text, you can have the whole screen – how much of that do you want?
         Text: I need X by Y points; I don’t need the rest.
         Background: OK. Hey, Color.red: you can have X by Y points – how much of that do you want?
         Color.red: I don’t care; I’m layout neutral, so X by Y points sounds good to me.
         
         */
    }
}

struct WhollyNeutralLayout_Previews: PreviewProvider {
    static var previews: some View {
        WhollyNeutralLayout()
    }
}

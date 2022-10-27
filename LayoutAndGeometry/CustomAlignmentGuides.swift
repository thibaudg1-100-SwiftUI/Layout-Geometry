//
//  CustomAlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

/*
 SwiftUI gives us alignment guides for the various edges of our views (.leading, trailing, top, and so on) plus .center and two baseline options to help with text alignment. However none of these work well when you’re working with views that are split across disparate views – if you have to make two views aligned the same when they are in entirely different parts of your user interface.
 
 To fix this, SwiftUI lets us create custom alignment guides, and use those guides in views across our UI. It doesn’t matter what comes before or after these views; they will still line up.
 
 If you want “@twostraws” and “Paul Hudson” to be vertically aligned together, you’ll have a hard time right now. The horizontal stack contains two vertical stacks inside it, so there’s no built-in way to get the alignment you want – things like HStack(alignment: .top) just won’t come close.

 To fix this we need to define a custom layout guide. This should be an extension on either VerticalAlignment or HorizontalAlignment, and be a custom type that conforms to the AlignmentID protocol.
 */

// The AlignmentID protocol has only one requirement, which is that the conforming type must provide a static defaultValue(in:) method that accepts a ViewDimensions object and returns a CGFloat specifying how a view should be aligned if it doesn’t have an alignmentGuide() modifier. You’ll be given the existing ViewDimensions object for the view, so you can either pick one of those for your default or use a hard-coded value.
extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
    
    /*
     You can see I’ve used the .top view dimension by default, and I’ve also created a static constant called midAccountAndName to make the custom alignment easier to use.

     Now, I mentioned that using an enum is preferable to a struct, and here’s why: we just created a new struct called MidAccountAndName, which means we could (if we wanted) create an instance of that struct even though doing so doesn’t make sense because it doesn’t have any functionality. If you replace struct MidAccountAndName with enum MidAccountAndName then you can’t make an instance of it any more – it becomes clearer that this thing exists only to house some functionality.
     */
}

struct CustomAlignmentGuides: View {
    var body: some View {
        // Regardless of whether you choose an enum or a struct, its usage stays the same: set it as the alignment for your stack, then use alignmentGuide() to activate it on any views you want to align together. This is only a guide: it helps you align views along a single line, but doesn’t say how they should be aligned. This means you still need to provide the closure to alignmentGuide() that positions the views along that guide as you want.
        
        // For example, we could update our Twitter code to use .midAccountAndName, then tell the account and name to use their center position for the guide. To be clear, that means “align these two views so their centers are both on the .midAccountAndName guide”.
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("64")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .font(.largeTitle)
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
            }
        }.border(.red)
        // That will make sure they are vertically aligned regardless of what comes before or after. I suggest you try adding some more text views before and after our examples – SwiftUI will reposition everything to make sure the two we aligned stay that way.
        // As long as there is no conflicting Alignment rules/guides.
    }
}

struct CustomAlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuides()
    }
}

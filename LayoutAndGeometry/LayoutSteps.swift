//
//  LayoutSteps.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

/*
 All SwiftUI layout happens in three simple steps, and understanding these steps is the key to getting great layouts every time. The steps are:

     A parent view proposes a size for its child.
     Based on that information, the child then chooses its own size and the parent must respect that choice.
     The parent then positions the child in its coordinate space.

 Behind the scenes, SwiftUI performs a fourth step: although it stores positions and sizes as floating-point numbers, when it comes to rendering SwiftUI rounds off any pixels to their nearest values so our graphics remain sharp.
 */

struct LayoutSteps: View {
    var body: some View {
        Text("Hello, world!")
            .background(.red)
        /*
         You’ll see the background color sits tightly around the text itself – it takes up only enough space to fit the content we provided.

         Now, think about this question: how big is ContentView? As you can see, the body of ContentView – the thing that it renders – is some text with a background color. And so the size of ContentView is exactly and always the size of its body, no more and no less. This is called being layout neutral: ContentView doesn’t have any size of its own, and instead happily adjusts to fit whatever size is needed.
         
         Back in project 3 I explained to you that when you apply a modifier to a view we actually get back a new view type called ModifiedContent, which stores both our original view and its modifier. This means when we apply a modifier, the actual view that goes into the hierarchy is the modified view, not the original one.

         In our simple background() example, that means the top-level view inside ContentView is the background, and inside that is the text. Backgrounds are layout neutral just like ContentView, so it will just pass on any layout information as needed – you can end up with a chain of layout information being passed around until a definitive answer comes back.

         If we put this into the three-step layout system, we end up with a conversation a bit like this:

             SwiftUI: “Hey, ContentView, you have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
             ContentView: “I don’t care; I’m layout neutral. Let me ask my child: hey, background, you have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
             Background: “I also don’t care; I’m layout neutral too. Let me ask my child: hey, text, you can have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
             Text: “Well, I have the letters ‘Hello, World’ in the default font, so I need exactly X pixels width by Y pixels height. I don’t need the whole screen, just that.” (Child chooses its size.)
             Background: “Got it. Hey, ContentView: I need X by Y pixels, please.”
             ContentView: “Right on. Hey, SwiftUI: I need X by Y pixels.”
             SwiftUI: “Nice. Well, that leaves lots of space, so I’m going to put you at your size in the center.” (Parent positions the child in its coordinate space.)

         */
    }
}

struct LayoutSteps_Previews: PreviewProvider {
    static var previews: some View {
        LayoutSteps()
    }
}

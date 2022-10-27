//
//  TieredEffect.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 18/04/2022.
//

import SwiftUI

struct TieredEffect: View {
    // Although the alignment guide closure is passed your view’s dimensions, you don’t need to use them if you don’t want to – you can send back a hard-coded number, or create some other calculation. For example, this creates a tiered effect for 10 text views by multiplying their position by -10:
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

struct TieredEffect_Previews: PreviewProvider {
    static var previews: some View {
        TieredEffect()
    }
}

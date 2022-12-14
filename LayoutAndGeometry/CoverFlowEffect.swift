//
//  CoverFlowEffect.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 19/04/2022.
//

import SwiftUI

struct CoverFlowEffect: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct CoverFlowEffect_Previews: PreviewProvider {
    static var previews: some View {
        CoverFlowEffect()
    }
}

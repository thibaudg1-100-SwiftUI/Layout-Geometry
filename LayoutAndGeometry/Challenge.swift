//
//  Challenge.swift
//  LayoutAndGeometry
//
//  Created by RqwerKnot on 19/04/2022.
//

import SwiftUI

struct Challenge: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min( 1.0, geo.frame(in: .global).minY / fullView.size.height), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
//                            .opacity(geo.frame(in: .global).minY / fullView.size.height)
                            .opacity(geo.frame(in: .global).minY > (fullView.size.height / 4)
                                    ? 1
                                    : geo.frame(in: .global).minY / (fullView.size.height / 4)
                            )
                            .scaleEffect(max(0.5, 1.5 * geo.frame(in: .global).minY / fullView.size.height))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}

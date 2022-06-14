//
//  Section.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct Section<Content: View>: View {
    
    @State var sectionTitle: String = ""
    var isHorizontal: Bool
    let viewBuilder: () -> Content

    
    init(
        sectionTitle: String,
        isHorizontal: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.sectionTitle = sectionTitle
        self.viewBuilder = content
        self.isHorizontal = isHorizontal
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
            if isHorizontal {
                ScrollView(.horizontal, showsIndicators: false) {
                    viewBuilder()
                }
            } else {
                ScrollView(showsIndicators: false) {
                    viewBuilder()
                }
            }
        }.padding(.vertical)
    }
}

struct Section_Previews: PreviewProvider {
    static var previews: some View {
        Section(sectionTitle: "a") {
            Text("Hello")
        }
    }
}

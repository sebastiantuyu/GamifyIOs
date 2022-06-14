//
//  GamePreviewBox.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct GamePreviewBox: View {
    @State var url: String
    
    init(
        url: String = "https://i.imgur.com/eOtEAB7.jpeg"
    ) {
        _url = State(initialValue: url)
        
        print(url)
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                VStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 150, alignment: .top)
                        .clipped()

                }            } else if phase.error != nil {
                Color.red
            } else {
                ZStack {
                    Image(systemName: "hourglass.tophalf.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.gray)
                }.frame(
                    width: 250, height: 150
                )
            }
        }
    }
}

struct GamePreviewBox_Previews: PreviewProvider {
    static var previews: some View {
        GamePreviewBox()
    }
}

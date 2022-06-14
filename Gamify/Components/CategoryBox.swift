//
//  Category.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct CategoryBox: View {

    var imageName: String = ""
    var categoryName: String = ""
    init(
        image imageName: String,
        category categoryName: String
    ) {
        self.imageName = imageName
        self.categoryName = categoryName
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color("LightBlue"))
                .frame(
                    width: 200,
                    height: 120
                )
            VStack {
                if !imageName.isEmpty {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("DarkCian"))
                        .frame(
                            width: 35,
                            height: 35
                        )
                }
                
                Text(categoryName)
                    .font(.title2)
                    .foregroundColor(Color("DarkCian"))
                    .bold()
            }
        }
    }
}

struct CategoryBox_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBox(
            image: "heart",
            category: "Favoritos")
    }
}

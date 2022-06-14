//
//  InputBar.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct InputBar: View {
    @Binding var querySearch: String
    @Binding var placeholder: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(
                    height: 50
                )
                .foregroundColor(Color("LightBlue"))
                .opacity(0.6)
                .cornerRadius(20.0)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if($querySearch.wrappedValue.isEmpty) {
                        Text(placeholder)
                            .padding(.leading)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    
                    
                    TextField(
                        "",
                        text: $querySearch
                    ).padding(.leading)
                    .foregroundColor(.white)
                }
            }
        }.padding(.vertical)
    }
}

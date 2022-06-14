//
//  TextBox.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct TextBox: View {
    @State var placeholder: String = ""
    @Binding var content: String
    @State var isSensitive: Bool

    init(
        placeholder: String,
        content: Binding<String>,
        isSensitive: Bool = false
    )
    {
        self.placeholder = placeholder
        _content = content
        self.isSensitive = isSensitive
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if $content.wrappedValue.isEmpty {
                    Text(placeholder).font(.caption).foregroundColor(Color.gray)
                }
                
                if isSensitive {
                    SecureField("", text: $content)
                        .foregroundColor(.white)
                } else {
                    TextField("", text: $content)
                        .foregroundColor(.white)
                }
            }
            
            Divider().frame(
                height: 1
            ).background(Color("DarkCian"))
                .padding(.bottom)
        }
    }
}

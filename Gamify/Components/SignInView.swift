//
//  SignInView.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var mail: String = ""
    
    @State var password: String = ""
    
    @State var isHomeActive: Bool = false
    
    func loginAndRedirect() {
        // Do login
        
        isHomeActive = true
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo electronico")
                    .foregroundColor(.white)

                TextBox(
                    placeholder: "email@ejemplo.com",
                    content: $mail)
                
                Text("Contraseña")
                    .foregroundColor(.white)
                
                TextBox(
                    placeholder: "Password",
                    content: $password,
                    isSensitive: true
                )
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(
                        width: 300,
                        alignment: .trailing
                    ).foregroundColor(.white)
                    .opacity(0.6)
                    .padding(.bottom)
                
                
                Button(action: loginAndRedirect, label: {
                    Text("INICIAR SESION")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        )
                        .padding(
                            EdgeInsets(
                                top: 11,
                                leading: 18,
                                bottom: 11,
                                trailing: 18
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("DarkCian"), lineWidth: 1.0)
                                .shadow(color: .white, radius: 3)
                        )
                        
                })
                
                Spacer(minLength: 35)
                
                Text("Inicia sesion con redes sociales")
                    .foregroundColor(.white)
                    .padding()
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )
                
                
                HStack {
                    Spacer()
                    Text("Facebook")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(
                            EdgeInsets(
                                top: 5,
                                leading: 25,
                                bottom: 5,
                                trailing: 25
                                
                            )
                        ).background(
                            Color("LightBlue")
                        ).cornerRadius(6)
                    
                    Spacer()
                    
                    Text("Twitter")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(
                            EdgeInsets(
                                top: 5,
                                leading: 25,
                                bottom: 5,
                                trailing: 25
                                
                            )
                        ).background(
                            Color("LightBlue")
                        ).cornerRadius(6)
                    Spacer()
                }
                
            }.padding(.horizontal, 77)
            
            
            NavigationLink(
                destination: HomeScreen(),
                isActive: $isHomeActive,
                label: {EmptyView()}
            )
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

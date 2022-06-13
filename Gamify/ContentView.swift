//
//  ContentView.swift
//  Gamify
//
//  Created by Sebastian on 12/06/22.
//

import SwiftUI


struct SignView: View {
    @State
    var positionState: Int = 0
        
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    positionState = 0
                }, label: {
                    Text("INICIA SESION")
                        .foregroundColor(.white)
                        .opacity(
                            positionState == 0
                            ? 1.0
                            : 0.3
                        )
                })
                
                Spacer()
                Button(action: {
                    positionState = 1
                }, label: {
                    Text("REGISTRATE")
                        .foregroundColor(.white)
                        .opacity(
                            positionState == 1
                            ? 1.0
                            : 0.3
                        )
                })
                Spacer()
            }
            
            
            // Forms
            Spacer(minLength: 42)
            if (positionState == 0 ) {
                SignInView()
            } else {
                SignUpView()
            }
        }
    }
}

struct SignUpView: View {
    
    @State var mail: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Elige una foto de perfil")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Puedes cambiar o elegir otra más adelante")
                    .font(.caption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .opacity(0.3)
                
                ZStack {
                    
                    Image("DummyProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: 80,
                            height: 80
                        )
                    
                    
                    Image(systemName: "camera")
                        .foregroundColor(.white)
                        .frame(
                            width: 80,
                            height: 80
                        )
                }
                
                Spacer(minLength: 50)
                
                VStack {
                    Text("Correo electronico")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(
                            width: 300,
                            alignment: .leading)
                    
                    TextBox(
                        placeholder: "ejemplo@gmail.com",
                        content: $mail
                    )
                    
                    Text("Password")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    
                    TextBox(
                        placeholder: "Password",
                        content: $password,
                        isSensitive: true
                    )
                    
                    Text("Confirm password")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    
                    TextBox(
                        placeholder: "Password",
                        content: $passwordConfirmation,
                        isSensitive: true
                    )
                }
                
                Button(action: {}, label: {
                    Text("REGISTRATE")
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
                
                Text("Registrate con redes sociales")
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
                
            }
            .padding(.horizontal, 77)
        }
    }
}


struct ContentView: View {
    var body: some View {
        ZStack {
            Color(
                red: 19/255,
                green: 30/255,
                blue: 53/255).ignoresSafeArea()
            
            VStack {
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding()
                
                SignView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

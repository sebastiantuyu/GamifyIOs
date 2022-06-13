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

struct TextBox: View {
    @State var placeholder: String = ""
    @State var content: Binding<String>
    @State var isSensitive: Bool
    
    init(
        placeholder: String,
        content: Binding<String>,
        isSensitive: Bool = false
    )
    {
        self.placeholder = placeholder
        self.content = content
        self.isSensitive = isSensitive
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if content.wrappedValue == "" {
                    Text(placeholder).font(.caption).foregroundColor(Color.gray)
                }
                
                if isSensitive {
                    SecureField("", text: content)
                        .foregroundColor(.white)
                } else {
                    TextField("", text: content)
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



struct SignInView: View {
    
    @State var mail: String = ""
    
    @State var password: String = ""

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
                
                
                Button(action: {
                    
                }, label: {
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
        }
    }
}

struct SignUpView: View {
    var body: some View {
        VStack {
            
            Text("Signup View")
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

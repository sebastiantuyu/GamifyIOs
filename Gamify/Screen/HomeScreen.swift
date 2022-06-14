//
//  HomeScreen.swift
//  Gamify
//
//  Created by Sebastian on 13/06/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var activeTabTag: Int = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
    }
    
    var body: some View {
        TabView (selection: $activeTabTag) {
                Home()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                }).tag(0)
            
            Text("Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem({
                    Image(systemName: "person")
                    Text("Perfil")
                }).tag(1)
            
            Text("Games")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem({
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }).tag(2)
            
            Text("Favorites")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem({
                    Image(systemName: "heart")
                    Text("Favoritos")
                }).tag(3)
        }.accentColor(.white)
    }
}

struct Home: View {
    
    @State var querySearch: String = ""
    @State var placeholder: String = "Buscar juegos..."
    
    var body: some View {
            ZStack {
                Color("Background").ignoresSafeArea()
                
                
                ScrollView(showsIndicators: false) {
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: 300
                        )
                    
                    VStack(alignment: .leading) {
                        InputBar(
                            querySearch: $querySearch,
                            placeholder: $placeholder
                        )
                        
                        Section(
                            sectionTitle: "LOS MÁS RECIENTES",
                            isHorizontal: true
                        ) {
                        VStack(spacing: 0) {
                            ZStack {
                                Image("GameDemo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//                                    .blur(radius: 0.8)

                                Image(systemName: "play")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(
                                        width: 50,
                                        height: 50
                                    ).foregroundColor(.white)
                            }.frame(
                                maxWidth: .infinity,
                                minHeight: 180,
                                maxHeight: 180
                                )
                            ZStack(alignment: .top) {
                                Rectangle()
                                    .foregroundColor(Color("LightBlue"))
    //                                        .opacity(0.5)
                                    .frame(
                                        height: 12,
                                        alignment: .top
                                    )

                                RoundedRectangle(cornerRadius: 8.0)
                                    .foregroundColor(Color("LightBlue"))
    //                                    .opacity(0.6)
                                .frame(
                                    height: 50
                                )
                                Text("The witcher 3: Wild Hunt")
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                                    .padding(.leading)

                            }
                         }
                        }
                        
                        Section(
                            sectionTitle: "CATEGORÍAS SUGERIDAS PARA TI",
                            isHorizontal: true
                        ) {
                            HStack {
                                CategoryBox(
                                    image: "circle.circle",
                                    category: "Shooters")
                                CategoryBox(
                                    image: "circle.grid.cross",
                                    category: "Arcade")
                                CategoryBox(
                                    image: "network",
                                    category: "Multiplayer")
                            }
                        }
                        
                        
                        Section(
                            sectionTitle: "RECOMENDADO PARA TI",
                            isHorizontal: true
                        ) {
                            
                            HStack {
                                GamePreviewBox()
                                
                                GamePreviewBox(
                                    url: "https://i.pinimg.com/originals/71/bb/ca/71bbca5651ac0589df0a36aa31dc188e.jpg"
                                )
                                
                                GamePreviewBox(
                                    url: "https://static.posters.cz/image/750/posters/gears-of-war-4-game-cover-i30650.jpg"
                                )
                                
                                GamePreviewBox(
                                    url: "https://m.media-amazon.com/images/I/61xfJLv0DJS._AC_SX385_.jpg"
                                )
                            }
                        }
                        
//                        Section(sectionTitle: "VIDEOS QUE PODRÍAN GUSTARTE") {
//                            HStack {
//                                GamePreviewBox()
//
//                                GamePreviewBox()
//
//                                GamePreviewBox()
//                            }
//                        }
                    }.frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    
                }.padding(.horizontal, 20)
                     
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

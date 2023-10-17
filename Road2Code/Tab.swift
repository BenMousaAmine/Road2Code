//
//  Tab.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//

import SwiftUI

struct Tab: View {
    @State private var tabViewSelection = 1
    @Binding var nickname: String
    let uiCustomColor = UIColor(
        red: 61 / 255.0 ,
        green:   59 / 255.0 ,
        blue: 142 / 255.0, alpha: 1.0
    )
    
    var body: some View {
        TabView(selection: $tabViewSelection) {
            Badges()
            .tabItem {
                Image(systemName: "app.badge")
            }.tag(0)
            Homepage(nickname: $nickname)
                .padding()
                .tabItem {
                Image(systemName: "house.fill")
            }.tag(1)
            Profile(nickname: $nickname)
            .tabItem {
                Image(systemName: "person.fill")
            }.tag(2)
        }
        .accentColor(Color.black)
        .onAppear() {
            UITabBar.appearance().backgroundColor = uiCustomColor
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
         
            }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct Tab_Previews: PreviewProvider {
    @State static var sampleNickname: String = "Prova"
    static var previews: some View {
        Tab(nickname: $sampleNickname)
    }
}

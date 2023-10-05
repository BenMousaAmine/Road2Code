//
//  Tab.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//

import SwiftUI

struct Tab: View {
    @State private var tabViewSelection = 1
    var body: some View {
        TabView(selection: $tabViewSelection) {
            Badges()
            .tabItem {
                Image(systemName: "app.badge")
                    .foregroundColor(Color.white)
                    .frame(width: 395, height: 80)
            }.tag(0)
            Homepage()
                .tabItem {
                Image(systemName: "house.fill")
                        .foregroundColor(Color(.secondaryLabel))
                    .frame(width: 395, height: 80)
            }.tag(1)
            Profile()
            .tabItem {
                Image(systemName: "person.fill")
                    .foregroundColor(Color.white)
                    .frame(width: 395, height: 80)
            }.tag(2)
        }.onAppear() {
            UITabBar.appearance().backgroundColor = .white
            }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}

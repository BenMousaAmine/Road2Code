//
//  ContentView.swift
//  Prova
//
//  Created by user245218 on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    let colorPerso = Color(
     red: 61 / 255.0 ,
     green:   59 / 255.0 ,
     blue: 142 / 255.0 )
    
    
    var body: some View {
        NavigationStack {
        VStack() {
            Image("Road2Code")
                .resizable().frame(width: 80, height: 80)
                .cornerRadius(10)
            Text("Benvenuto in")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Road2Code")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colorPerso)
                NavigationLink(destination: Login()){
                    Text("Accedi")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 280)
                        .frame(height: 60)
                        .background(colorPerso)
                        .foregroundColor(Color.white)
                        .cornerRadius(7)
                        .padding(15)
                }
                NavigationLink(destination: Register()){
                        Text("Registrati")
                            .font(.title)
                            .frame(width: 280)
                            .frame(height: 60)
                            .background(Color.white)
                            .foregroundColor(colorPerso)
                            .border(colorPerso , width: 3)
                            .cornerRadius(7)
                }.navigationBarBackButtonHidden(true)
            }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

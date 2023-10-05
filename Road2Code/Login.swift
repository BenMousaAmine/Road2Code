//
//  Login.swift
//  Road2Code
//
//  Created by user245218 on 9/28/23.
//

import SwiftUI

struct Login: View {
    @State var username = ""
    @State var password = ""
    let colorPerso = Color(
     red: 61 / 255.0 ,
     green:   59 / 255.0 ,
     blue: 142 / 255.0 )
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Road2Code")
                    .resizable().frame(width: 80, height: 80)
                    .cornerRadius(10)
                Text("ROAD2CODE")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(colorPerso)
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .frame(width: 250, height: 40)
                    .border(colorPerso)
                    .padding(10)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250, height: 40)
                    .border(colorPerso)
                    .padding(10)
                Text("Password dimenticata?")
                    .foregroundColor(colorPerso)
                NavigationLink(destination: Tab()) {
                    Text("Accedi")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.white)
                        .padding(5)
                }.background(colorPerso)
                    .cornerRadius(10)
                    .padding(10)
                    .disabled(username != "" && password != "" ? false : true)
                HStack {
                    Text("Nuovo utente?")
                    NavigationLink(destination: Register()){
                        Text("Registrati")
                    }.foregroundColor(colorPerso)
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

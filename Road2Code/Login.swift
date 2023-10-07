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
    @State var passVisble : Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                      Image("Road2Code")
                          .resizable().frame(width: 80, height: 80)
                          .cornerRadius(10)
                      Text("ROAD2CODE")
                          .font(.largeTitle)
                          .fontWeight(.heavy)
                          .foregroundColor(Color.CostumColor)
                          .padding(.bottom, 60)
                    CustomTextField (text : $username , imageName: "person" , placeholder: "User name")
                         .frame(width: 280 )
                    CustomPassword(password: $password, isPasswordVisible: $passVisble)
                         .frame(width: 280 )
                Text("Password dimenticata?")
                    .foregroundColor(Color.CostumColor)
                    .padding(10)
                NavigationLink(destination: Tab()) {
                    Text("Accedi")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.white)
                        .padding(5)
                }.background(Color.CostumColor)
                    .cornerRadius(10)
                    .padding(10)
                    .disabled(username != "" && password != "" ? false : true)
                HStack {
                    Text("Nuovo utente?")
                    NavigationLink(destination: Register()){
                        Text("Registrati")
                    }.foregroundColor(Color.CostumColor)
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

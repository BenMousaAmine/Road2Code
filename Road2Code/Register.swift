//
//  Register.swift
//  Road2Code
//
//  Created by user245218 on 9/28/23.
//

import SwiftUI

struct Register: View {
    @State var nickname = ""
    @State var password = ""
    @State var repeatPassword = ""
    @State var passVisb : Bool = false
    @State var repeatPassVisb : Bool = false
    @State var email = ""
 
    @State var itemName: String = ""
    @State var isOn = false
  
    
    var body: some View {
        NavigationStack {
            VStack {
              Text("Register")
                CustomTextField(text:$nickname , imageName: "person" , placeholder: "Nikname*")
                    .frame(width: 300)
                CustomTextField(text:$nickname , imageName: "mail" , placeholder: "Email*")
                    .frame(width: 300)
                CustomPassword(password: $password, isPasswordVisible : $passVisb ,placeholder: "password")
                    .frame(width: 300)
                CustomPassword(password: $repeatPassword, isPasswordVisible : $repeatPassVisb ,placeholder:"Repeat your password ")
                    .frame(width: 300)
            HStack() {
                    Toggle(isOn: $isOn) {}
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(Color.CostumColor)
                    Text("Accetta i termini di servizio")
                        .foregroundColor(Color.CostumColor)
                }
                
                
                
                
                Button(action: {
                    
                }) {
                    Text("Registrati")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.CostumColor)
                        .padding(5)
                }.background(Color.white)
                    .cornerRadius(10)
                    .border(Color.CostumColor)
                    .disabled(nickname != "" && password != "" && email != "" ? true : false)
                HStack {
                    Text("Hai già un account?")
                    NavigationLink(destination: Login()) {
                        Text("Accedi")
                    }
                    .foregroundColor(Color.CostumColor)
                    .navigationBarBackButtonHidden(true)

                }
            }
        }
    }
    
}
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

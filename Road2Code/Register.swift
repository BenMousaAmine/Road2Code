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
    @State var email = ""
    @State var itemName: String = ""
    @State var isOn = false
    @State var borderColor: Bool = false
    let colorPerso = Color(
        red: 61 / 255.0 ,
        green:   59 / 255.0 ,
        blue: 142 / 255.0 )
    
    
    
    struct TextInputField: View {
        let placeHolder: String
        @Binding var textValue: String
        @State private var larger = true
        var body: some View {
            ZStack(alignment: .leading) {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .offset(y: textValue.isEmpty ? 0 : -25)
                    .scaleEffect(textValue.isEmpty ? 1: 0.8, anchor: .leading)
                TextField("", text: $textValue)
            }
            .padding(.top, textValue.isEmpty ? 0 : 15)
            .frame(height: 52)
            .padding(.horizontal, 16)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
            .animation(.default , value: larger )
            .onAppear{larger = false}
            
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextInputField(placeHolder: "nick name" , textValue: $itemName)
                Image("Road2Code")
                    .resizable().frame(width: 80, height: 80)
                    .cornerRadius(10)
                Text("ROAD2CODE")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(colorPerso)
                if borderColor == false {
                    TextField("Nickname", text: $nickname)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 250, height: 40)
                        .border(colorPerso)
                        .cornerRadius(5)
                        .padding(15)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .frame(width: 250, height: 40)
                        .border(colorPerso)
                        .padding(15)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .frame(width: 250, height: 40)
                        .border(colorPerso)
                        .padding(15)
                }
                else {
                    TextField("Nickname", text: $nickname)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 250, height: 40)
                        .border(Color.red)
                        .cornerRadius(5)
                        .padding(15)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .frame(width: 250, height: 40)
                        .border(Color.red)
                        .padding(15)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .frame(width: 250, height: 40)
                        .border(Color.red)
                        .padding(15)
                }
                HStack {
                    Toggle(isOn: $isOn) {
                        Text("Accetta i termini di servizio")
                    }
                }
                Button(action: {
                    if nickname == "" && email == "" && password == "" {
                        borderColor = true
                    }
                }) {
                    Text("Registrati")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(colorPerso)
                        .padding(5)
                }.background(Color.white)
                    .cornerRadius(10)
                    .border(colorPerso)
                    .disabled(nickname != "" && password != "" && email != "" ? true : false)
                HStack {
                    Text("Hai già un account?")
                    NavigationLink(destination: Login()) {
                        Text("Accedi")
                    }.foregroundColor(colorPerso)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

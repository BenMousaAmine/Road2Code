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
    @State var date = ""
    @State var itemName: String = ""
    @State var isOn = false
    @State var isLogged = false
    
    func insertData(nickname: String, email: String, password: String, notifica: Bool) {
        let supabaseURL = URL(string: "https://ywsbqtupbreoiylewpxr.supabase.co/rest/v1/Utente")
        var request = URLRequest(url: supabaseURL!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl3c2JxdHVwYnJlb2l5bGV3cHhyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0MDYzMjcsImV4cCI6MjAxMTk4MjMyN30.r3IN1U6HcBefc8ZJx0STaY0-aceQ8UQS7-omqdiGnhw", forHTTPHeaderField: "apikey")
        
        let data: [String: Any] = [
            "Immagine": "https://ibb.co/qjgHyTG",
            "Nickname": nickname,
            "Email": email,
            "Password": password,
            "Notifica": notifica
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            request.httpBody = jsonData
        } catch {
            print("Error serializing JSON data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                    isLogged = true
                    // Data inserted successfully
                }
            }
        }
        
        task.resume()
    }
    
    var body: some View {
        if isLogged {
            Tab(nickname: $nickname)
        }
        else {
            NavigationStack {
                VStack {
                    Image("Road2Code")
                        .resizable().frame(width: 80, height: 80)
                        .cornerRadius(10)
                    Text("ROAD2CODE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.CustomColor)
                    CustomTextField(text:$nickname , imageName: "person" , placeholder: "Nickname")
                        .frame(width: 300)
                    CustomTextField(text:$email , imageName: "mail" , placeholder: "Email")
                        .frame(width: 300)
                    CustomPassword(password: $password, isPasswordVisible : $passVisb ,placeholder: "Password")
                        .frame(width: 300)
                    CustomPassword(password: $repeatPassword, isPasswordVisible : $repeatPassVisb ,placeholder:"Ripeti password ")
                        .frame(width: 300)
                    
                    HStack() {
                        Toggle(isOn: $isOn) {}
                            .toggleStyle(iOSCheckboxToggleStyle())
                            .foregroundColor(Color.CustomColor)
                        Text("Accetta i termini di servizio")
                            .foregroundColor(Color.CustomColor)
                    }.padding(20)
                    /*Button(action: {
                        insertData(nickname: nickname, email: email, password: password, notifica: isOn)
                    }) {*/
                    NavigationLink(destination: Tab(nickname: $nickname)){
                        Text("Registrati")
                            .frame(width: 250, height: 45)
                            .font(.system(size: 26))
                            .foregroundColor(Color.CustomColor)
                            .padding(5)
                    }.background(Color.white)
                        .cornerRadius(10)
                        .border(Color.CustomColor)
                        .disabled(nickname != "" && password != "" && email != "" ? true : false)
                    HStack {
                        Text("Hai già un account?")
                        NavigationLink(destination: Login()) {
                            Text("Accedi")
                        }
                        .foregroundColor(Color.CustomColor)
                        .navigationBarBackButtonHidden(true)
                        
                    }
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

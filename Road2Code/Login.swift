//
//  Login.swift
//  Road2Code
//
//  Created by user245218 on 9/28/23.
//

import SwiftUI
import Supabase

struct Login: View {
    @State var nickname = ""
    @State var password = ""
    @State var passVisble : Bool = false
    @State var isLogged = false
    
    func loginUser(nickname: String, password: String) {
        
        let supabaseURL = URL(string: "https://ywsbqtupbreoiylewpxr.supabase.co/auth/v1/token?grant_type=password")
        var request = URLRequest(url: supabaseURL!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl3c2JxdHVwYnJlb2l5bGV3cHhyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0MDYzMjcsImV4cCI6MjAxMTk4MjMyN30.r3IN1U6HcBefc8ZJx0STaY0-aceQ8UQS7-omqdiGnhw", forHTTPHeaderField: "apikey")
        
        let credentials: [String: Any] = [
            "Nickname": nickname,
            "Password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: credentials)
            request.httpBody = jsonData
        } catch {
            print("Error serializing JSON data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let userToken = try JSONDecoder().decode(UserToken.self, from: data)
                    print("User Token: \(userToken.accessToken)")
                    isLogged = true
                    // Successfully logged in; you can store the token or perform other actions
                } catch {
                    print("Error decoding user token: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
    struct UserToken: Decodable {
        let accessToken: String
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
                        .padding(.bottom, 60)
                    CustomTextField (text : $nickname , imageName: "person" , placeholder: "Nickname")
                        .frame(width: 280 )
                    CustomPassword(password: $password, isPasswordVisible: $passVisble, placeholder: "Password")
                        .frame(width: 280 )
                    Text("Password dimenticata?")
                        .foregroundColor(Color.CustomColor)
                        .padding(10)
                    /*Button(action: {
                        loginUser(nickname: nickname, password: password)
                    }) {*/
                    NavigationLink(destination: Tab(nickname: $nickname)) {
                        Text("Accedi")
                            .frame(width: 250, height: 45)
                            .font(.system(size: 26))
                            .foregroundColor(Color.white)
                            .padding(5)
                    }.background(Color.CustomColor)
                        .cornerRadius(10)
                        .padding(10)
                        .disabled(nickname != "" && password != "" ? false : true)
                    HStack {
                        Text("Nuovo utente?")
                        NavigationLink(destination: Register()){
                            Text("Registrati")
                        }.foregroundColor(Color.CustomColor)
                            .navigationBarBackButtonHidden(true)
                    }
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

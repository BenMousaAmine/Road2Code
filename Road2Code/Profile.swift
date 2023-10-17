//
//  Profile.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//

import SwiftUI

struct Profile: View {
    @State var emailAddress : String = ""
    @State var password : String = ""
    @Binding var nickname: String
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("octopus")
                        .resizable().frame(width: 100, height: 100)
                        .cornerRadius(90)
                        .padding(20)
                    VStack {
                        Text(nickname)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.CustomColor)
                            .frame(maxWidth: 400)
                        ProgressView(value: 0.25)
                        .cornerRadius(10)
                        .scaleEffect(x: 0.8, y: 2, anchor: .center)
                        Text("5% completato")
                            .font(.system(size: 13))
                    }
                    Spacer().frame(width: 70)
                }
            }
            Spacer().frame(height: 20)
            HStack {
                Text("Quiz finiti")
                    .fontWeight(.bold)
                    .foregroundColor(Color.CustomColor)
                Spacer()
            }
            HStack {
                Image("Java")
                    .resizable().frame(width: 41, height: 30)
                Spacer().frame(width: 20)
                Text("Java")
                Spacer()
            }.padding(.bottom)
            VStack{
                HStack {
                    Text("Condividi")
                        .foregroundColor(Color.CustomColor)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .padding(.bottom)
                    Spacer()
                }
                HStack {
                    Image("X")
                        .resizable().frame(width: 31, height: 30)
                        .cornerRadius(90)
                    Spacer().frame(width: 20)
                    Text("Seguici su X")
                    Spacer()
                }
                HStack {
                    Image("facebook")
                        .resizable().frame(width: 31, height: 30)
                    Spacer().frame(width: 20)
                    Text("Mi piace su Facebook")
                    Spacer()
                }
            }.padding(.bottom)
            VStack{
                HStack{
                    Text("Contatti")
                        .foregroundColor(Color.CustomColor)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                        .padding(.bottom)
                    Spacer()
                }
                HStack {
                    Image(systemName: "questionmark.circle")
                        .resizable().frame(width: 31, height: 30)
                    Spacer().frame(width: 20)
                    Text("Help")
                    Spacer()

                }
                HStack {
                    Image(systemName: "lock")
                        .resizable().frame(width: 31, height: 30)
                    Spacer().frame(width: 20)
                    Text("Termini e condizioni")
                    Spacer()
                }
                HStack {
                    Image(systemName: "hand.raised")
                        .resizable().frame(width: 31, height: 30)
                    Spacer().frame(width: 20)
                    Text("Privacy Policy")
                    Spacer()
                }
            }
            VStack {
                NavigationLink(destination: ContentView()) {
                    Text("Log out")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.white)
                        .padding(5)
                }.background(Color.CustomColor)
                    .cornerRadius(10)
                    .padding(20)
                NavigationLink(destination: ContentView()) {
                    Text("Elimina account")
                        .foregroundColor(Color.red)
                }
            }
        }.padding()
    }
           
}

struct Profile_Previews: PreviewProvider {
    @State static var sampleNickname: String = "Prova"
    static var previews: some View {
        Profile(nickname: $sampleNickname)
    }
}

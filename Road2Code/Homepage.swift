//
//  Homepage.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//

import SwiftUI

struct LanguageButtonView: View {
    let language: String

    var body: some View {
        HStack {
            Image(language)
                .resizable()
                .frame(width: 130, height: 80, alignment: .bottom)
            Text(language)
                .padding(10)
                .fontWeight(.bold)
                .foregroundColor(Color.CustomColor)
        }
    }
}
struct Homepage: View {
    @Binding var nickname: String
    @State private var selectedLanguage: String?
    let languages = ["Java", "JavaScript", "Python", "React", "Database", "HTML:CSS"]

    var body: some View {
        NavigationView {
            VStack {
                Image("Road2Code")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .cornerRadius(10)
                Text("Ciao " + nickname)
                    .font(.system(size: 36))
                    .bold()
                    .foregroundColor(Color.CustomColor)
                Spacer().frame(height: 20)
                Text("Completa i seguenti quiz e ")
                    .font(.system(size: 18))
                    .bold()
                    .padding(7)
                Text("Ottieni la tua roadmap")
                    .foregroundColor(Color.CustomColor)
                    .bold()
                    .font(.system(size: 26))
                Spacer()
                VStack {
                    ForEach(languages, id: \.self) { language in
                        NavigationLink(destination: QuizStart(language: language), tag: language, selection: $selectedLanguage) {
                                LanguageButtonView(language: language)
                            }
                        .buttonStyle(PlainButtonStyle())
                        .onTapGesture {
                            selectedLanguage = language
                        }
                    }
                }
            }
         
        }
    }
}


struct Homepage_Previews: PreviewProvider {
    @State static var sampleNickname: String = "Prova"
    static var previews: some View {
        Homepage(nickname: $sampleNickname)
    }
}

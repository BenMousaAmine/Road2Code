//
//  QuizStart.swift
//  Road2Code
//
//  Created by user245218 on 10/14/23.
//

import SwiftUI


struct QuizStart: View {
    let language: String

    var body: some View {
        VStack{
            VStack {
                Image(language)
                    .resizable()
                    .frame(width: 200, height: 120, alignment: .bottom)
                
            }
            VStack{
                Text(language)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.CustomColor)
                    .bold()
                    .padding()
                Text("Argomenti : ")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.CustomColor)
                Text("TEMPO")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.CustomColor)
            }
            .frame(width: 350.0, height: 400.0)
            .border(Color.CustomColor ,width:2)
            .padding(10)
            HStack {
                NavigationLink(destination: Quiz()) {
                    Text("Inizia quiz")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.white)
                        .padding(5)
                }.background(Color.CustomColor)
                    .cornerRadius(10)
                    .padding(10)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct QuizStart_Previews: PreviewProvider {
    static var previews: some View {
        QuizStart(language: "Java")
    }
}

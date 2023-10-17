//
//  Homepage.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//

import SwiftUI

struct Homepage: View {
    let colorPerso = Color(
        red: 61 / 255.0 ,
        green:   59 / 255.0 ,
        blue: 142 / 255.0 )
    var body: some View {
        VStack {
            Image("Road2Code")
                .resizable().frame(width: 50, height: 50, alignment: .leading)
                .cornerRadius(10)
            Text("Ciao Nickname")
                .font(.system(size: 36))
                .bold()
                .foregroundColor(colorPerso)
            Spacer().frame(height: 80)
            Text("Completa i seguenti quiz e ")
                .font(.system(size: 18))
                .bold()
                .padding(7)
            Text("Ottieni la tua roadmap")
                .foregroundColor(colorPerso)
                .bold()
                .font(.system(size: 26))
            Spacer()
            VStack {
                HStack {
                    VStack {
                        Image("Java")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("Java")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                    VStack {
                        Image("JavaScript")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("JavaScript")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                }
                HStack {
                    VStack {
                        Image("Python")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("Python")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                    VStack {
                        Image("React")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("React")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                }.padding(20)
                HStack {
                    VStack {
                        Image("Database")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("Database")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                    VStack {
                        Image("HTML:CSS")
                            .resizable().frame(width: 150, height: 80, alignment: .bottom)
                        Text("HTML/CSS")
                            .padding(10)
                            .foregroundColor(colorPerso)
                    }
                }.padding(30)
            }
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

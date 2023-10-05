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
            VStack(alignment: .leading) {
                Image("Road2Code")
                    .resizable().frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            Text("Ciao Nickname")
                .font(.system(size: 36))
                .bold()
                .foregroundColor(colorPerso)
            Spacer()
            Text("Completa i seguenti quiz e ")
                .font(.system(size: 18))
                .bold()
                .padding(7)
            Text("Ottieni la tua roadmap")
                .foregroundColor(colorPerso)
                .bold()
                .font(.system(size: 26))
            Spacer()
            HStack {
                Text("Java")
                Text("JavaScript")
            }
            Tab()
                
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

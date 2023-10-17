//
//  Badges.swift
//  Road2Code
//
//  Created by user245218 on 10/5/23.
//
import SwiftUI

struct Badges: View {
    var body: some View {
        VStack {
            Text("Collezione Medaglie")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(Color.CustomColor)
            Spacer().frame(height: 30)
            Text("Non hai medaglie attualmente")
            // Stile medaglie
            /*HStack {
                Image(systemName: "bell")
                    .foregroundColor(Color.white)
                Text("Java")
                    .foregroundColor(Color.white)
                    .frame(width: 170, height: 100)
                    .fontWeight(.bold)
            }.background(Color.CustomColor)
                .cornerRadius(10)*/
        }
        
    }
}
struct Badges_Previews: PreviewProvider {
    static var previews: some View {
        Badges()
    }
}

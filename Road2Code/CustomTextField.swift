//
//  CustomTextField.swift
//  Road2Code
//
//  Created by user245218 on 10/7/23.
//

import SwiftUI

struct CustomTextField : View {
    @Binding var text: String
    @State   var imageName : String = ""
    @State   var  placeholder : String = ""

    var body: some View {
        HStack {
            if !text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .offset(x: -5)
                Spacer()
            }else{
                Text("        ")
                    .foregroundColor(.gray)
                    .offset(x:-5)
                Spacer()
            }
        }
        .padding(.leading)
        
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 22, height: 24)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.CustomColor, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

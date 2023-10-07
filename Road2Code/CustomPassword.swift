//
//  CustomPassword.swift
//  Road2Code
//
//  Created by user245218 on 10/7/23.
//

import SwiftUI

struct CustomPassword: View {
        @Binding var password: String
        @Binding var isPasswordVisible: Bool

        var body: some View {
            HStack {
                if !password.isEmpty {
                    Text("Password")
                        .foregroundColor(.gray)
                        .offset(x: -5)
                    Spacer()
                }else{
                    Text("    ")
                        .foregroundColor(.gray)
                        .offset(x: -5)
                    Spacer()
                }
            }
            .padding(.leading)
            .padding(5)
            
            HStack {
                Image(systemName: "key")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)

                if isPasswordVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }

                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.CostumColor, lineWidth: 1)
            )
            .padding(.horizontal)
        }
    }

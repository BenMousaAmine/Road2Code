//
//  ErrorMessage.swift
//  Road2Code
//
//  Created by user245218 on 10/17/23.
//

import Foundation


struct ErrorMessage: Identifiable, Codable {
    var id = UUID()
    var message: String?
    var hint: String?
}

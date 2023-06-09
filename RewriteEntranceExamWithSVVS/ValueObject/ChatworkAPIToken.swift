//
//  ChatworkAPIToken.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

struct ChatworkAPIToken: Codable, Equatable {
    let value: String
    
    init(value: String) throws {
        if isSingleByteAlphanumericCharacters(value: value) == false {
            throw ValueObjectError.invalidValue
        }
        
        self.value = value
        
        func isSingleByteAlphanumericCharacters(value: String) -> Bool {
            value.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && !value.isEmpty
        }
    }
    
    static func == (lhs: ChatworkAPIToken, rhs: ChatworkAPIToken) -> Bool {
        return lhs.value == rhs.value
    }
}

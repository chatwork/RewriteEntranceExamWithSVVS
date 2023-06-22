//
//  ChatworkAPIToken.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

public struct ChatworkAPIToken: Codable, Equatable {
    public let value: String
    
    public init(value: String) throws {
        if isSingleByteAlphanumericCharacters(value: value) == false {
            throw ValueObjectError.invalidValue
        }
        
        self.value = value
        
        func isSingleByteAlphanumericCharacters(value: String) -> Bool {
            value.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && !value.isEmpty
        }
    }
    
    public static func == (lhs: ChatworkAPIToken, rhs: ChatworkAPIToken) -> Bool {
        return lhs.value == rhs.value
    }
}

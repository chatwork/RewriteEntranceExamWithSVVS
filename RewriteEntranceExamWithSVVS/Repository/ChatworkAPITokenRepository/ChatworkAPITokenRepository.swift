//
//  ChatworkAPITokenRepository.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

struct ChatworkAPITokenRepository {
    private let key = "ChatworkAPIToken"
    
    func save(data: String) {
        let encoder = JSONEncoder()
        
        do {
            let encoded = try encoder.encode(data)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: key,
                kSecValueData as String: data
            ]
            
            let status = SecItemCopyMatching(query as CFDictionary, nil)
            switch status {
            case errSecItemNotFound:
                SecItemAdd(query as CFDictionary, nil)
            case errSecSuccess:
                SecItemUpdate(query as CFDictionary, [kSecValueData as String: data] as CFDictionary)
            default:
                debugPrint("失敗\(status)")
            }
        } catch {
            // TODO: 例外処理
        }
    }
    
//    func load() {
//
//    }
}

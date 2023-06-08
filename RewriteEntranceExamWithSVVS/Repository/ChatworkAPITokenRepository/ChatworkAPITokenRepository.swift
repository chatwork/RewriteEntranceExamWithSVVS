//
//  ChatworkAPITokenRepository.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

struct ChatworkAPITokenRepository {
    private let key = "ChatworkAPIToken"
    
    // TODO: ChatworkAPIToken型を引数で受け取るように修正
    func save(tokenData: ChatworkAPIToken) {
        let encoder = JSONEncoder()
        
        do {
            let encoded = try encoder.encode(tokenData)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: key,
                kSecValueData as String: encoded
            ]
            
            let status = SecItemCopyMatching(query as CFDictionary, nil)
            switch status {
            case errSecItemNotFound:
                SecItemAdd(query as CFDictionary, nil)
            case errSecSuccess:
                SecItemUpdate(query as CFDictionary, [kSecValueData as String: encoded] as CFDictionary)
            default:
                debugPrint("失敗\(status)")
            }
        } catch {
            // TODO: 例外処理
        }
    }
    
    func load() -> ChatworkAPIToken? {
        let query: [String: Any] = [
                kSecClass              as String: kSecClassGenericPassword,
                kSecAttrService        as String: key,
                kSecMatchLimit         as String: kSecMatchLimitOne,
                kSecReturnAttributes   as String: true,
                kSecReturnData         as String: true
            ]
        
        var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            switch status {
            case errSecItemNotFound:
                return nil
            case errSecSuccess:
                guard let item = item,
                      let value = item[kSecValueData as String] as? Data else {
                          print("データなし")
                          return nil
                      }
                do {
                    return try JSONDecoder().decode(ChatworkAPIToken.self, from: value)
                } catch {
                    print("エラー")
                }
            default:
                print("該当なし")
            }
            return nil
    }
}

//
//  ChatworkAPITokenStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import XCTest

@MainActor
final class ChatworkAPITokenStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
        let repository = ChatworkAPITokenRepository()
        repository.delete()
    }

    func test_Keychainに値がない場合はStoreの値がnilである() throws {
        ChatworkAPITokenStore.shared.load()
        XCTAssertNil(ChatworkAPITokenStore.shared.value)
    }
    
    func test_Keychainに値をセットするとStoreの値もセットした値になる() throws {
        let apiToken = try ChatworkAPIToken(value: "token1234")
        ChatworkAPITokenStore.shared.save(tokenData: apiToken)
        
        XCTAssertEqual(ChatworkAPITokenStore.shared.value, apiToken)
    }
    
    func test_Keychainにセットした値を削除することができ_それに連動してStoreの値もnilになる() throws {
        let apiToken = try ChatworkAPIToken(value: "token1234")
        ChatworkAPITokenStore.shared.save(tokenData: apiToken)
        XCTAssertEqual(ChatworkAPITokenStore.shared.value, apiToken)
        
        ChatworkAPITokenStore.shared.delete()
        XCTAssertNil(ChatworkAPITokenStore.shared.value)
    }
}

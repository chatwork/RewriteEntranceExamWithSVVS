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
}

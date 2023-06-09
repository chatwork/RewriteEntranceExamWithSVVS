//
//  ChatworkAPITokenRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import XCTest

final class ChatworkAPITokenRepositoryTests: XCTestCase {
    override func setUp() {
        super.setUp()
        let repository = ChatworkAPITokenRepository()
        repository.delete()
    }
    
    func test_Keychainに未保存状態で取得を行ったときにnilが返ってくること() throws {
        let repository = ChatworkAPITokenRepository()
        let loadResult = repository.load()
        
        XCTAssertNil(loadResult)
    }
    
    func test_Kyechainに保存を行った後に取得を行うと_保存した値が返ってくること() throws {
        let repository = ChatworkAPITokenRepository()
        let apiToken = try ChatworkAPIToken(value: "token1234")
        repository.save(tokenData: apiToken)
        let loadResult = repository.load()

        XCTAssertEqual(loadResult, apiToken)
    }
}

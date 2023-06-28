//
//  RoomMessageAPITests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import XCTest
@testable import ChatworkAPI

@MainActor
final class RoomMessageAPITests: XCTestCase {
    let token = testAPIToken
    
    func test_メッセージが送られ_message_idがStringで帰ってくる() async throws {
        let api = RoomMessageAPI()
        let roomId = 0 // inputAnyRoomId
        let result = try await api.put(token: ChatworkAPIToken(value: token), roomId: roomId, body: "テストメッセージ")
        
        XCTAssert(result is String)
    }
}

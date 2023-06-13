//
//  RoomMessageRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import XCTest

@MainActor
final class RoomMessageRepositoryTests: XCTestCase {
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String
    
    func test_メッセージが送られ_message_idがStringで帰ってくる() async throws {
        let repository = RoomMessageRepository()
        let roomId = 0 // inputAnyRoomId
        let result = try await repository.put(token: ChatworkAPIToken(value: token), roomId: roomId, body: "テストメッセージ")
        
        XCTAssert(result is String)
    }
}

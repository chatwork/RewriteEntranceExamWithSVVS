//
//  RoomListAPITests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import XCTest

final class RoomListAPITests: XCTestCase {
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String

    func test_ChatworkAPIへ正しいTokenでリクエストをするとRoomList型のモデルが返ってくること() async throws {
        let api = RoomListAPI()
        let result = try await api.fetch(token: ChatworkAPIToken(value: token))

        XCTAssertTrue(result is RoomList)
    }

}

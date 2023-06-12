//
//  RoomListRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import XCTest

final class RoomListRepositoryTests: XCTestCase {
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String

    func test_ChatworkAPIへ正しいTokenでリクエストをするとRoomList型のモデルが返ってくること() async throws {
        let repository = RoomListRepository()
        let result = try await repository.fetch(token: ChatworkAPIToken(value: token))

        XCTAssertTrue(result is RoomList)
    }

}

//
//  RoomListAPITests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import XCTest
@testable import ChatworkAPI

final class RoomListAPITests: XCTestCase {
    let token = testAPIToken

    func test_ChatworkAPIへ正しいTokenでリクエストをするとRoomList型のモデルが返ってくること() async throws {
        let api = RoomListAPI()
        let result = try await api.fetch(token: ChatworkAPIToken(value: token))

        XCTAssertTrue(result is RoomListGetResponse)
    }
}

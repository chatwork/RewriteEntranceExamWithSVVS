//
//  RoomListStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import XCTest

@MainActor
final class RoomListStoreTests: XCTestCase {
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String

    func test_RoomListStoreからAPIを経由してルーム一覧の情報を取得できる() async throws {
        // RoomListStoreのAPIをMockに差し替え
        RoomListStore.shared.injectionRoomListAPIMock(mock: RoomListAPIMock(desiredStatus: .successFetch))
        
        try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
        XCTAssertNotNil(RoomListStore.shared.value)
    }
    
    func test_APIがfetchでstatusCodeIsNot200を投げた場合に_RoomListStoreにRoomListの情報が存在せず_その例外が伝播される() async throws {
        // RoomListStoreのAPIをMockに差し替え
        RoomListStore.shared.injectionRoomListAPIMock(mock: RoomListAPIMock(desiredStatus: .throwStatusCodeIsNot200))
        do {
            try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.statusCodeIsNot200)
            XCTAssertNil(RoomListStore.shared.value)
        }
    }
    
    func test_APIがfetchでfailedToDecodeModelを投げた場合に_RoomListStoreにRoomListの情報が存在せず_その例外が伝播される() async throws {
        // RoomListStoreのAPIをMockに差し替え
        RoomListStore.shared.injectionRoomListAPIMock(mock: RoomListAPIMock(desiredStatus: .throwFailedToDecodeModel))
        do {
            try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.failedToDecodeModel)
            XCTAssertNil(RoomListStore.shared.value)
        }
    }
}

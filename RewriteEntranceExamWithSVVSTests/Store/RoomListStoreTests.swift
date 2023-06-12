//
//  RoomListStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import XCTest

final class RoomListStoreTests: XCTestCase {
    
    
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String

    func test_RoomListStoreからRepositoryを経由してルーム一覧の情報を取得できる() async throws {
        // RoomListStoreのRepositoryをMockに差し替え
        RoomListStore.shared.injectionRoomListRepositoryMock(mock: RoomListRepositoryMock(desiredStatus: .successFetch))
        
        try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
        XCTAssertNotNil(RoomListStore.shared.value)
    }
    
    func test_RepositoryがfetchでstatusCodeIsNot200を投げた場合に_RoomListStoreにRoomListの情報が存在せず_その例外が伝播される() async throws {
        // RoomListStoreのRepositoryをMockに差し替え
        RoomListStore.shared.injectionRoomListRepositoryMock(mock: RoomListRepositoryMock(desiredStatus: .throwStatusCodeIsNot200))
        do {
            try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.statusCodeIsNot200)
            XCTAssertNil(RoomListStore.shared.value)
        }
    }
    
    func test_RepositoryがfetchでfailedToDecodeModelを投げた場合に_RoomListStoreにRoomListの情報が存在せず_その例外が伝播される() async throws {
        // RoomListStoreのRepositoryをMockに差し替え
        RoomListStore.shared.injectionRoomListRepositoryMock(mock: RoomListRepositoryMock(desiredStatus: .throwFailedToDecodeModel))
        do {
            try await RoomListStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.failedToDecodeModel)
            XCTAssertNil(RoomListStore.shared.value)
        }
    }
}

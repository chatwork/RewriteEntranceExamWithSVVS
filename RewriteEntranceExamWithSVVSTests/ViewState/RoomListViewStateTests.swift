//
//  RoomListViewStateTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import XCTest

@MainActor
final class RoomListViewStateTests: XCTestCase {
    override func setUp() {
        super.setUp()
        RoomListStore.shared.setUpForUnitTest()
    }
    
    func test_ViewStateでfetchを依頼しRoomListStoreの値が変わると_RoomListViewStateの値も連動する() async throws {
         
        let state = RoomListViewState()
        RoomListStore.shared.setUpForUnitTest()
        RoomListStore.shared.injectionRoomListAPIMock(mock: RoomListAPIMock.successFetch)
        XCTAssertEqual(state.roomList.count, 0)
        
        await state.fetchRoomList()
        
        XCTAssertEqual(state.roomList.count, RoomListStore.shared.value?.body.count)
        XCTAssertEqual(state.roomList.count, 1)
    }

}

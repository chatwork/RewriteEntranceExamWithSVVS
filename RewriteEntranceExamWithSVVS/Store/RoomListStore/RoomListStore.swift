//
//  RoomListStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

@MainActor
final class RoomListStore {
    static let shared: RoomListStore = .init()
    
    @Published private(set) var value: RoomList?
    
    private var roomListAPI: RoomListAPIProtocol = RoomListAPI()
    
    func fetch(token: ChatworkAPIToken) async throws {
        let fetchResult = try await roomListAPI.fetch(token: token)
        value = fetchResult
    }
}

#if TEST
// ユニットテスト用のメソッド
extension RoomListStore {
    func setUpForUnitTest() {
        value = nil
        roomListAPI = RoomListAPI()
    }
    
    func injectionRoomListAPIMock(mock: RoomListAPIProtocol) {
        roomListAPI = mock
    }
}
#endif

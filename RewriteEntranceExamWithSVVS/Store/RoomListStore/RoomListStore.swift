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
    
    private var roomListRepository: RoomListRepositoryProtocol = RoomListRepository()
    
    func fetch(token: ChatworkAPIToken) async throws {
        let fetchResult = try await roomListRepository.fetch(token: token)
        value = fetchResult
    }
}

// ユニットテスト用のメソッド
extension RoomListStore {
    func setUpForUnitTest() {
        value = nil
        roomListRepository = RoomListRepository()
    }
    
    func injectionRoomListRepositoryMock(mock: RoomListRepositoryProtocol) {
        roomListRepository = mock
    }
}

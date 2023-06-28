//
//  RoomListStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation
import ChatworkAPI

@MainActor
public final class RoomListStore {
    public static let shared: RoomListStore = .init()
    
    @Published public private(set) var value: RoomList?
    
    private var roomListAPI: RoomListAPIProtocol = RoomListAPI()
    
    public func fetch(token: ChatworkAPIToken) async throws {
        let fetchResult = try await roomListAPI.fetch(token: token)
        value = RoomList.comvert(from: fetchResult)
    }
}

// ユニットテスト用のメソッド(internalで収まる)
extension RoomListStore {
    func setUpForUnitTest() {
        value = nil
        roomListAPI = RoomListAPI()
    }
    
    func injectionRoomListAPIMock(mock: RoomListAPIProtocol) {
        roomListAPI = mock
    }
}

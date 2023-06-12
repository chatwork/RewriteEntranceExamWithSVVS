//
//  RoomListViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

@MainActor
final class RoomListViewState: ObservableObject {
    @Published var roomList: [RoomInfo] = []
    
    init() {
        // Store購読の処理
        roomList = testData
    }
    
    // リスト表示に必要なものを抜粋した型
    struct RoomInfo {
        let roomId: Int
        let name: String
        // 多分ピン留めに必要な情報
        let sticky: Bool
        let unreadNum: Int
        let mentionNum: Int
    }
    
    // テストデータ
    let testData = [
        RoomInfo(
            roomId: 0,
            name: "テスト1",
            sticky: false,
            unreadNum: 0,
            mentionNum: 0
        ),
        RoomInfo(
            roomId: 1,
            name: "テスト2",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        ),
        RoomInfo(
            roomId: 1,
            name: "テスト\(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        ),
        RoomInfo(
            roomId: 1,
            name: "テスト\(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        ),
        RoomInfo(
            roomId: 1,
            name: "テスト\(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        )
    ]
}

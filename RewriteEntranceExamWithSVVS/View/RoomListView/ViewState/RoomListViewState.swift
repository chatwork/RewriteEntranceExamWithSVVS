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
    struct RoomInfo: Identifiable {
        let id: Int
        let roomId: Int
        let name: String
        // 多分ピン留めに必要な情報
        let sticky: Bool
        let unreadNum: Int
        let mentionNum: Int
        
        init(roomId: Int, name: String, sticky: Bool, unreadNum: Int, mentionNum: Int) {
            self.roomId = roomId
            self.name = name
            self.sticky = sticky
            self.unreadNum = unreadNum
            self.mentionNum = mentionNum
            
            self.id = roomId
        }
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
            roomId: 2,
            name: "テスト \(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        ),
        RoomInfo(
            roomId: 3,
            name: "テスト\(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        ),
        RoomInfo(
            roomId: 4,
            name: "テスト\(Date.now)",
            sticky: true,
            unreadNum: 1,
            mentionNum: 2
        )
    ]
}

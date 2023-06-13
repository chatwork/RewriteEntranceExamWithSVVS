//
//  RoomListViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Combine
import Foundation

@MainActor
final class RoomListViewState: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    @Published private(set) var roomList: [RoomInfo] = []
    
    init() {
        // Store購読の処理
        RoomListStore.shared.$value
            .sink { roomListObject in
                if let roomListObject {
                    self.roomList = roomListObject.body.map({ room in
                        RoomInfo(
                            roomId: room.roomId,
                            name: room.name,
                            sticky: room.sticky,
                            unreadNum: room.unreadNum,
                            mentionNum: room.mentionNum
                        )
                    })
                } else {
                    self.roomList = []
                }
            }
            .store(in: &cancellables)
        
        Task {
            await fetchRoomList()
        }
    }
    
    func fetchRoomList() async {
        // tokenがないとこの画面には辿り着けないはずから強制アンラップできそう
        // 追記：これだとSwiftUIのプレビューで落ちる、ログイン通ってきてなくて、トークンないから
        let token = ChatworkAPITokenStore.shared.value! // swiftlint:disable:this force_unwrapping
        
        do {
            try await RoomListStore.shared.fetch(token: token)
        } catch {
            // TODO: 例外処理
        }
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
}

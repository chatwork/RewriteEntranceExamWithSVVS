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
    
    // 部屋一覧情報
    @Published private(set) var roomList: [RoomInfo] = []
    // Storeのfetchが失敗した時の例外を伝えるフラグ
    @Published var failedFetchRoomListAlertFlag = false
    
    init() {
        // Store購読の処理
        RoomListStore.shared.$value
            .sink { roomListObject in
                if let roomListObject {
                    // Storeのデータを表示用に整形
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
                    // Storeのデータがnilならルームは空
                    self.roomList = []
                }
            }
            .store(in: &cancellables)
        
        // Storeのfetchの実行
        Task {
            await fetchRoomList()
        }
    }
    
    // Storeのルーム情報取得に失敗した時のに表示されるアラートの「再読み込みボタン」の動作
    func onTapFailedFetchRoomListAlertButton() async {
        await fetchRoomList()
    }
    
    // Storeにルーム情報の取得を依頼
    func fetchRoomList() async {
        // tokenがないとこの画面には辿り着けないはずから強制アンラップできそう
        // 追記：これだとSwiftUIのプレビューで落ちる、ログイン通ってきてなくて、トークンないから
        let token = ChatworkAPITokenStore.shared.value! // swiftlint:disable:this force_unwrapping
        
        do {
            try await RoomListStore.shared.fetch(token: token)
        } catch {
            failedFetchRoomListAlertFlag = true
        }
    }
    
    // リスト表示に必要なものを抜粋した型
    // (Storeから渡されたデータから不要なものを削ぎ落とした型)
    struct RoomInfo: Identifiable {
        // Identifiable準拠
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
            // roomIdは重複しないはず
            self.id = roomId
        }
    }
}

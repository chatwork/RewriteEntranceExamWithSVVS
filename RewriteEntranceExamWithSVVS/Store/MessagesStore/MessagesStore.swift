//
//  MessagesStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/15.
//

import Foundation
import ChatworkAPI

/*
    Messagesというデータは存在しないが、メッセージ送信の際にViewStateからAPIへリクエストを送ることに違和感を感じ、作成しました
        以下Confluenceより引用
        ---
        - ViewStateという名前が示すとおり、よりViewの状態管理に特化している
            - 例）入力されたデータをAPIでサーバに送信したい
              ViewModel: ViewModel内にAPIの呼び出し処理などを実装
              ViewState: Storeに送信を依頼するのみ
            - ViewStateの方はより本質的なコード（プレゼンテーションロジックのみ）の状態になる
        ---
    MessagesStoreという命名にしたのは、
    ・「メッセージ送信の責務を持たせるStoreとしての妥当性を感じたこと」
    ・「メッセージ一覧を表示する機能が必要になった際に、そのデータをMessagesとして管理することが想定できるため」
    です。ですが、この「想定できる」はYAGNIの原則に反しているのではないかという感覚もあります。
 */
@MainActor
final class MessagesStore {
    static let shared: MessagesStore = .init()
    
    private var roomMessageAPI: RoomMessageAPIProtocol = RoomMessageAPI()
    
    func sendMessage(token: ChatworkAPIToken, roomId: Int, message: String) async throws {
        try await _ = roomMessageAPI.put(token: token, roomId: roomId, body: message)
    }
}

#if TEST
// ユニットテスト用のメソッド
extension MessagesStore {
    func injectionRoomMessageAPIMock(mock: RoomMessageAPIProtocol) {
        roomMessageAPI = mock
    }
}
#endif

//
//  RoomViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Combine
import Foundation

@MainActor
final class RoomViewState: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    // 入力されたメッセージ
    @Published var message = ""
    // 送信ボタンの有効無効切り替え
    var disabledSendButton: Bool {
        return message.isEmpty ? true : false
    }
    
    // 前画面から受け取ったroomId(Storeからデータを引いてくるのに使う)
    private let roomId: Int
    @Published private(set) var roomName: String = ""
    
    @Published var failedSendMessageAlertFlag = false
    
    init(roomId: Int) {
        self.roomId = roomId
        
        RoomListStore.shared.$value
            .sink { roomList in
                if let roomList {
                    // roomIdを照合
                    let matchRoom = roomList.body.first { roomObject in
                        roomObject.roomId == roomId
                    }
                    if let matchRoom {
                        self.roomName = matchRoom.name
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    // 送信ボタンの処理
    func onTapSendButton() async {
        let token = ChatworkAPITokenStore.shared.value! // swiftlint:disable:this force_unwrapping
        do {
            _ = try await MessagesStore.shared.sendMessage(token: token, roomId: roomId, message: message)
            // 入力メッセージを消す
            self.message = ""
        } catch {
            failedSendMessageAlertFlag = true
        }
    }
    
    // アラートの再送信ボタンの処理
    func onTapFailedAlertResendButton() async {
        let token = ChatworkAPITokenStore.shared.value! // swiftlint:disable:this force_unwrapping
        do {
            _ = try await MessagesStore.shared.sendMessage(token: token, roomId: roomId, message: message)
            // 入力メッセージを消す
            self.message = ""
        } catch {
            failedSendMessageAlertFlag = true
        }
    }
}

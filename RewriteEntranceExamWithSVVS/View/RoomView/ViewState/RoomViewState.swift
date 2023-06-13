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
    
    @Published var message = ""
    var disabledSendButton: Bool {
        return message.isEmpty ? true: false
    }
    
    private let roomId: Int
    @Published private(set) var roomName: String = ""
      
    init(roomId: Int) {
        self.roomId = roomId
        
        RoomListStore.shared.$value
            .sink { roomList in
                if let roomList {
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
    
    func onTapSendButton() {
        let token = ChatworkAPITokenStore.shared.value!
        Task {
            do {
                _ = try await RoomMessageRepository().put(token: token, roomId: roomId, body: message)
                // 入力メッセージを消す
                self.message = ""
            } catch {
                // TODO: 例外処理
            }
        }
    }
}

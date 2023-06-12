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
        
    }
}

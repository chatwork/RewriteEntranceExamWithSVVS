//
//  RoomListRepositoryMock.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

struct RoomListRepositoryMock: RoomListRepositoryProtocol {
    private let desiredStatus: Status
    init(desiredStatus: Status) {
        self.desiredStatus = desiredStatus
    }
    
    func fetch(token: ChatworkAPIToken) async throws -> RoomList {
        try? await Task.sleep(nanoseconds: 1_000_000)
        switch desiredStatus {
        case.successFetch:
            return roomList
        case .throwStatusCodeIsNot200:
            throw APIError.statusCodeIsNot200
        case .throwFailedToDecodeModel:
            throw APIError.failedToDecodeModel
        }
    }
    
    // fetchの結果を決める
    enum Status {
        case successFetch
        case throwStatusCodeIsNot200
        case throwFailedToDecodeModel
    }
    
    private let roomList = RoomList(
        body: [
            .init(
                roomId: 0,
                name: "",
                type: "",
                role: "",
                sticky: true,
                unreadNum: 0,
                mentionNum: 0,
                mytaskNum: 0,
                messageNum: 0,
                fileNum: 0,
                taskNum: 0,
                iconPath: "",
                lastUpdateTime: 0
            )
        ]
    )
}

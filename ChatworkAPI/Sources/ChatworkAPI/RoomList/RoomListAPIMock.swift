//
//  RoomListAPIMock.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation
import ChatworkAPI

enum RoomListAPIMock: RoomListAPIProtocol {
    case successFetch
    case throwStatusCodeIsNot200
    case throwFailedToDecodeModel
    
    func fetch(token: ChatworkAPIToken) async throws -> RoomListGetResponse {
        try? await Task.sleep(nanoseconds: 1_000_000_00)
        switch self {
        case.successFetch:
            return roomList
        case .throwStatusCodeIsNot200:
            throw APIError.statusCodeIsNot200
        case .throwFailedToDecodeModel:
            throw APIError.failedToDecodeModel
        }
    }
    
    private var roomList: RoomListGetResponse {
        RoomListGetResponse (
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
}

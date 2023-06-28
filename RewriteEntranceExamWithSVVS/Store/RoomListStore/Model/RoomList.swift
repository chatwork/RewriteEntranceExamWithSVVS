//
//  RoomList.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import ChatworkAPI
import Foundation

struct RoomList {
    let body: [RoomObject]
    
    struct RoomObject {
        let roomId: Int
        let name: String
        let type: String
        let role: String
        let sticky: Bool
        let unreadNum: Int
        let mentionNum: Int
        let mytaskNum: Int
        let messageNum: Int
        let fileNum: Int
        let taskNum: Int
        let iconPath: String
        let lastUpdateTime: Int
        
        static func comvert(from: RoomListGetResponse.RoomObject) -> RoomObject {
            RoomObject(
                roomId: from.roomId,
                name: from.name,
                type: from.type,
                role: from.role,
                sticky: from.sticky,
                unreadNum: from.unreadNum,
                mentionNum: from.mentionNum,
                mytaskNum: from.mytaskNum,
                messageNum: from.messageNum,
                fileNum: from.fileNum,
                taskNum: from.taskNum,
                iconPath: from.iconPath,
                lastUpdateTime: from.lastUpdateTime
            )
        }
    }
    
    static func comvert(from: RoomListGetResponse) -> RoomList {
        RoomList(
            body: from.body.map({ room in
                RoomObject.comvert(from: room)
            })
        )
    }
}

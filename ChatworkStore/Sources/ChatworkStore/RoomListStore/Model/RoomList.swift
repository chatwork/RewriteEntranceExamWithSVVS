//
//  RoomList.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import ChatworkAPI
import Foundation

public struct RoomList {
    public init(body: [RoomList.RoomObject]) {
        self.body = body
    }
    
    public let body: [RoomObject]
    
    public struct RoomObject {
        public init(roomId: Int, name: String, type: String, role: String, sticky: Bool, unreadNum: Int, mentionNum: Int, mytaskNum: Int, messageNum: Int, fileNum: Int, taskNum: Int, iconPath: String, lastUpdateTime: Int) {
            self.roomId = roomId
            self.name = name
            self.type = type
            self.role = role
            self.sticky = sticky
            self.unreadNum = unreadNum
            self.mentionNum = mentionNum
            self.mytaskNum = mytaskNum
            self.messageNum = messageNum
            self.fileNum = fileNum
            self.taskNum = taskNum
            self.iconPath = iconPath
            self.lastUpdateTime = lastUpdateTime
        }
        
        public let roomId: Int
        public let name: String
        public let type: String
        public let role: String
        public let sticky: Bool
        public let unreadNum: Int
        public let mentionNum: Int
        public let mytaskNum: Int
        public let messageNum: Int
        public let fileNum: Int
        public let taskNum: Int
        public let iconPath: String
        public let lastUpdateTime: Int
        
        public static func comvert(from: RoomListGetResponse.RoomObject) -> RoomObject {
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
    
    public static func comvert(from: RoomListGetResponse) -> RoomList {
        RoomList(
            body: from.body.map({ room in
                RoomObject.comvert(from: room)
            })
        )
    }
}

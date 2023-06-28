//
//  File.swift
//  
//
//  Created by cw-ryu.nakayama on 2023/06/28.
//

import Foundation

public struct RoomListGetResponse {
    public init(body: [RoomObject]) {
        self.body = body
    }
    
    public let body: [RoomObject]
    
    public struct RoomObject: Decodable {
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
        
        enum CodingKeys: String, CodingKey {
            case roomId = "room_id"
            case name = "name"
            case type = "type"
            case role = "role"
            case sticky = "sticky"
            case unreadNum = "unread_num"
            case mentionNum = "mention_num"
            case mytaskNum = "mytask_num"
            case messageNum = "message_num"
            case fileNum = "file_num"
            case taskNum = "task_num"
            case iconPath = "icon_path"
            case lastUpdateTime = "last_update_time"
        }
    }
}

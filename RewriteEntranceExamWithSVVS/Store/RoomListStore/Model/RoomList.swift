//
//  RoomList.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import Foundation

struct RoomList {
    let body: [RoomObject]
    
    struct RoomObject: Decodable {
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

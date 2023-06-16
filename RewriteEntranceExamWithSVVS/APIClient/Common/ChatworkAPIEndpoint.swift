//
//  ChatworkAPIURL.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import Foundation

struct ChatworkAPIEndpoint {
    static private let meEndpoint = "https://api.chatwork.com/v2/me"
    
    static var getMeEndpoint: URL {
        return URL(string: meEndpoint)! // swiftlint:disable:this force_unwrapping
    }
    
    static private let roomsEndpoint = "https://api.chatwork.com/v2/rooms"
    
    static var getRoomsEndpoint: URL {
        return URL(string: roomsEndpoint)! // swiftlint:disable:this force_unwrapping
    }
    
    static func getRoomMessageEndpoint(roomId: Int) -> URL {
        return URL(string: roomsEndpoint + "/\(roomId)/messages")! // swiftlint:disable:this force_unwrapping
    }
}

//
//  RoomMessageAPIProtocol.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/20.
//

import Foundation
import ChatworkAPI

public protocol RoomMessageAPIProtocol {
    func put(token: ChatworkAPIToken, roomId: Int, body: String) async throws -> String
}

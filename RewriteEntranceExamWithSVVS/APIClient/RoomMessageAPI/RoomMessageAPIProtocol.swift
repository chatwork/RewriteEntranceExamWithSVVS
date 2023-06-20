//
//  RoomMessageAPIProtocol.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/20.
//

import Foundation

protocol RoomMessageAPIProtocol {
    func put(token: ChatworkAPIToken, roomId: Int, body: String) async throws -> String
}

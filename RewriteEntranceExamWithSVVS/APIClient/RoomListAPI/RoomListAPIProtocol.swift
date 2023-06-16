//
//  File.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

protocol RoomListAPIProtocol {
    func fetch(token: ChatworkAPIToken) async throws -> RoomList
}

//
//  File.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

protocol RoomListRepositoryProtocol {
    func fetch(token: ChatworkAPIToken) async throws -> RoomList
}

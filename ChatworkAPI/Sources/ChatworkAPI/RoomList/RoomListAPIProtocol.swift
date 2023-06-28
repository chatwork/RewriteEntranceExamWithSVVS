//
//  File.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import Foundation

public protocol RoomListAPIProtocol {
    func fetch(token: ChatworkAPIToken) async throws -> RoomListGetResponse
}

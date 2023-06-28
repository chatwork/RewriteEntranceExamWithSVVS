//
//  RoomMessageAPIMock.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/20.
//

import Foundation

enum RoomMessageAPIMock: RoomMessageAPIProtocol {
    case successFetch
    case throwStatusCodeIsNot200
    case throwFailedToDecodeModel
    
    func put(token: ChatworkAPIToken, roomId: Int, body: String) async throws -> String {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        switch self {
            
        case .successFetch:
            return "messageId"
        case .throwStatusCodeIsNot200:
            throw APIError.statusCodeIsNot200
        case .throwFailedToDecodeModel:
            throw APIError.failedToDecodeModel
        }
    }
}

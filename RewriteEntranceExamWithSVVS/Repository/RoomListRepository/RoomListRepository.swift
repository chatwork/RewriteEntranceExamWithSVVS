//
//  RoomListRepository.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import Foundation

struct RoomListRepository: RoomListRepositoryProtocol {
    func fetch(token: ChatworkAPIToken) async throws -> RoomList {
        let url = ChatworkAPIEndpoint.getRoomsEndpoint
        var request = URLRequest(url: url)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        let headers = [
            "accept": "application/json",
            "x-chatworktoken": token.value
        ]
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let responseStatusCode = (response as! HTTPURLResponse).statusCode
        
        // 200以外は早期リターン
        if responseStatusCode != 200 {
            throw APIError.statusCodeIsNot200
        }
        
        // デコードする
        do {
            let decodeResult = try JSONDecoder().decode([RoomList.RoomObject].self, from: data)
            let roomListObject = RoomList(body: decodeResult)
            return roomListObject
        } catch {
            throw APIError.failedToDecodeModel
        }
    }
}

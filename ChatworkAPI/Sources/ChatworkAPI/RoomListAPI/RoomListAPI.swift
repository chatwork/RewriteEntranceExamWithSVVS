//
//  RoomListAPI.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import Foundation

public struct RoomListAPI: RoomListAPIProtocol {
    public init() {}
    
    public func fetch(token: ChatworkAPIToken) async throws -> RoomListGetResponse {
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
            let decodeResult = try JSONDecoder().decode([RoomListGetResponse.RoomObject].self, from: data)
            let roomListObject = RoomListGetResponse(body: decodeResult)
            return roomListObject
        } catch {
            throw APIError.failedToDecodeModel
        }
    }
}

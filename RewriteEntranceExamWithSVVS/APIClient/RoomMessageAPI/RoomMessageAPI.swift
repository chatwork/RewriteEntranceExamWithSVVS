//
//  RoomMessageAPI.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import Foundation
import ChatworkAPI

struct RoomMessageAPI: RoomMessageAPIProtocol {
    func put(token: ChatworkAPIToken, roomId: Int, body: String) async throws -> String {
        let url = ChatworkAPIEndpoint.getRoomMessageEndpoint(roomId: roomId)
        var request = URLRequest(url: url)

        request.httpMethod = HTTPMethod.post.rawValue

        // 検討: 他APIでも共通な気がするから切り出し候補
        let headers = [
          "accept": "application/json",
          "x-chatworktoken": token.value
        ]
        request.allHTTPHeaderFields = headers
        
        let postData = NSMutableData(data: "body=\(body)".data(using: .utf8)!) // swiftlint:disable:this force_unwrapping
        request.httpBody = postData as Data

        // リクエスト
        let (data, response) = try await URLSession.shared.data(for: request)

        let responseStatusCode = (response as! HTTPURLResponse).statusCode

        print(responseStatusCode)
        // 200以外は早期リターン
        if responseStatusCode != 200 {
            throw APIError.statusCodeIsNot200
        }

        // デコードする
        do {
            let decodeResult = try JSONDecoder().decode(ResponseDecodeModel.self, from: data)
            return decodeResult.messageId

        } catch {
            throw APIError.failedToDecodeModel
        }
        
        struct ResponseDecodeModel: Decodable {
            let messageId: String
            
            enum CodingKeys: String, CodingKey {
                case messageId = "message_id"
            }
        }
    }
}

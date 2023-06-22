//
//  MeAPI.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import Foundation

struct MeAPI: MeAPIProtocol {
    // tokenは間違った引数を渡すのを防ぐために値オブジェクトに変更する余地はある
    func fetch(token: ChatworkAPIToken) async throws -> MeGetResponse {
        let url = ChatworkAPIEndpoint.getMeEndpoint
        var request = URLRequest(url: url)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        // 検討: 他APIでも共通な気がするから切り出し候補
        let headers = [
          "accept": "application/json",
          "x-chatworktoken": token.value
        ]
        request.allHTTPHeaderFields = headers
        
        // リクエスト
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let responseStatusCode = (response as! HTTPURLResponse).statusCode
        
        // 200以外は早期リターン
        if responseStatusCode != 200 {
            throw APIError.statusCodeIsNot200
        }
        
        // デコードする
        do {
            let decodeResult = try JSONDecoder().decode(MeGetResponse.self, from: data)
            return decodeResult
        } catch {
            throw APIError.failedToDecodeModel
        }
    }
}

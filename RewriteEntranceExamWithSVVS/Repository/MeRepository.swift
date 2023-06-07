//
//  MeRepository.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import Foundation

struct MeRepository {
    // TODO: 引数の型変えたい
    func fetch(token: String) async throws -> Me {
        let url = ChatworkAPIURL.getURL
        var request = URLRequest(url: url)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        // 検討: 他Repositoryでも共通な気がするから切り出し候補
        let headers = [
          "accept": "application/json",
          "x-chatworktoken": token
        ]
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print((response as! HTTPURLResponse).statusCode)
        
        let responseStatusCode = (response as! HTTPURLResponse).statusCode
        
        // 200以外は早期リターン
        if responseStatusCode != 200 {
            throw HTTPError.statusCodeIsNot200
        }
        
        // 仮置き
        return Me(accountId: 0, roomId: 0, name: "", chatworkId: "", organizationId: 0, organizationName: "", department: "", title: "", url: "", introduction: "", mail: "", telOrganization: "", telExtension: "", telMobile: "", skype: "", facebook: "", twitter: "", avatarImageUrl: "", loginMail: "")
    }
}

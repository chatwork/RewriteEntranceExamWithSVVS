//
//  MeAPITests.swift
//  
//
//  Created by cw-ryu.nakayama on 2023/06/28.
//

import XCTest
@testable import ChatworkAPI

final class MeAPITests: XCTestCase {
    let token = testAPIToken
    
    // Meの返ってくることを確認できればOKとする
    func test_ChatworkAPIへ正しいTokenでリクエストをするとMe型のモデルが返ってくること() async throws {
        let api = MeAPI()
        let result = try await api.fetch(token: ChatworkAPIToken(value: token))
        
        XCTAssertTrue(result is MeGetResponse) // 常にtrueだけど、テストの意図を伝えるための記述
    }
    
    func test_ChatworkAPIへ間違ったTokenでリクエストをすると例外が返ってくること() async throws {
        let api = MeAPI()
        do {
            _ = try await api.fetch(token: ChatworkAPIToken(value: "invalidToken"))
            XCTFail("期待した例外が起きませんでした")
        } catch {
            // catchに入れば成功のためPass
        }
    }

}

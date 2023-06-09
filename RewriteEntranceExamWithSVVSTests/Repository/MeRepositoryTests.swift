//
//  MeRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import XCTest

final class MeRepositoryTests: XCTestCase {
    // Meの返ってくることを確認できればOKとする
    func test_ChatworkAPIへ正しいTokenでリクエストをするとMe型のモデルが返ってくること() async throws {
        let repository = MeRepository()
        let result = try await repository.fetch(token: ChatworkAPIToken(value: "inputYourToken"))
        
        XCTAssertTrue(result is Me) // 常にtrueだけど、テストの意図を伝えるための記述
    }
    
    func test_ChatworkAPIへ間違ったTokenでリクエストをすると例外が返ってくること() async throws {
        let repository = MeRepository()
        do {
            _ = try await repository.fetch(token: ChatworkAPIToken(value: "invalidToken"))
            XCTFail("期待した例外が起きませんでした")
        } catch {
            // catchに入れば成功のためPass
        }
    }
}

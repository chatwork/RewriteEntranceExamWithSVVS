//
//  MeRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import XCTest

final class MeRepositoryTests: XCTestCase {
    // Meの返ってくることを確認できればOKとする
    func testChatworkAPIへ正しいTokenでリクエストをするとMe型のモデルが返ってくること() async throws {
        let repository = MeRepository()
        _ = try await repository.fetch(token: ChatworkAPIToken(value: "inputYourToken"))
    }
    
    func testChatworkAPIへ間違ったTokenでリクエストをすると例外が返ってくること() async throws {
        let repository = MeRepository()
        do {
            _ = try await repository.fetch(token: ChatworkAPIToken(value: "invalidToken"))
            XCTFail("期待した例外が起きませんでした")
        } catch {
            // catchに入れば成功のためPass
        }
    }
}

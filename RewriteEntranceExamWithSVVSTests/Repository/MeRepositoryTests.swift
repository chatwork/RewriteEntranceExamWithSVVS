//
//  MeRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import XCTest

final class MeRepositoryTests: XCTestCase {
    // Meの返ってくることを確認できればOKとする
    func testChatworkAPIへリクエストをするとMe型のモデルが返ってくること() async throws {
        let repository = MeRepository()
        try await repository.fetch(token: "input your token")
    }
}

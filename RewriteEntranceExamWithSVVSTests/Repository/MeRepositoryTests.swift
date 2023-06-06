//
//  MeRepositoryTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import XCTest

final class MeRepositoryTests: XCTestCase {
    // Meの返ってくることを確認できればOKとする
    func testChatworkAPIへリクエストをするとMe型のモデルが返ってくること() throws {
        let repository = MeRepository()
        Task.detached {
            XCTAssertNoThrow(try await repository.fetch())
        }
    }
}

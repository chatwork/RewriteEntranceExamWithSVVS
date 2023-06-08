//
//  MeStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import XCTest

@MainActor
final class MeStoreTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Storeのvalueは private (set) になるはずなので、Store内にsetUp用のメソッドを置く(間違ってプロダクト内で呼ばれないかは心配)
        MeStore.shared.setUpForUnitTest()
    }
    
    func testMeStoreからRepositoryを経由してMeの情報を取得できる() async throws {
        // MeStoreのRepositoryをMockに差し替え
        MeStore.shared.injectionMeRepositoryMock(mock: MeRepositoryMock(desiredStatus: .successFetch))
        
        try await MeStore.shared.fetch(token: "input your token")
        XCTAssertNotNil(MeStore.shared.value)
    }
}

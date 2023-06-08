//
//  MeStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import XCTest

final class MeStoreTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Storeのvalueは private (set) になるはずなので、Store内にsetUp用のメソッドを置く(間違ってプロダクト内で呼ばれないかは心配)
        let MeStore.shared.setUpForUnitTest()
    }
    
    func testMeStoreからRepositoryを経由してMeの情報を取得できる() async throws {
        // MeStoreはシングルトンで実装予定なのでどうやって一時的にRepositoryをMockに差し替えようか検討した結果、一時的にMockを渡してコールバックの中身を処理してもらう方法を考えた
        MeStore.shared.temporaryReplaceMeRepository(MeRepositoryMock()) {
            await MeStore.shared.fetch()
            XCTAssertNotNil(MeStore.shared.value)
        }
    }
}

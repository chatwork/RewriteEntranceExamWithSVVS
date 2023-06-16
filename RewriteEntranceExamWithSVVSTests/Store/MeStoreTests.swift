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
    
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String
    
    func test_MeStoreからAPIを経由してMeの情報を取得できる() async throws {
        // MeStoreのAPIをMockに差し替え
        MeStore.shared.injectionMeAPIMock(mock: MeAPIMock(desiredStatus: .successFetch))
        
        try await MeStore.shared.fetch(token: ChatworkAPIToken(value: token))
        XCTAssertNotNil(MeStore.shared.value)
    }
    
    func test_APIがfetchでstatusCodeIsNot200を投げた場合に_MeStoreにMeの情報が存在せず_その例外が伝播される() async throws {
        // MeStoreのAPIをMockに差し替え
        MeStore.shared.injectionMeAPIMock(mock: MeAPIMock(desiredStatus: .throwStatusCodeIsNot200))
        do {
            try await MeStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.statusCodeIsNot200)
            XCTAssertNil(MeStore.shared.value)
        }
    }
    
    func test_APIがfetchでfailedToDecodeModelを投げた場合に_MeStoreにMeの情報が存在せず_その例外が伝播される() async throws {
        // MeStoreのAPIをMockに差し替え
        MeStore.shared.injectionMeAPIMock(mock: MeAPIMock(desiredStatus: .throwFailedToDecodeModel))
        do {
            try await MeStore.shared.fetch(token: ChatworkAPIToken(value: token))
            XCTFail("例外を期待したのに起きませんでした")
        } catch {
            XCTAssertEqual(error as! APIError, APIError.failedToDecodeModel)
            XCTAssertNil(MeStore.shared.value)
        }
    }
}

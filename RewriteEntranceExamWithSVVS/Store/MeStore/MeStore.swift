//
//  MeStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation
import ChatworkAPI

@MainActor
final class MeStore {
    static let shared: MeStore = .init()
    
    @Published private(set) var value: Me?
    
    private var meAPI: MeAPIProtocol = MeAPI()
    
    func fetch(token: ChatworkAPIToken) async throws {
        let fetchResult = try await meAPI.fetch(token: token)
        value = Me.comvert(from: fetchResult)
    }
}

#if TEST
// ユニットテスト用のメソッド
extension MeStore {
    // プロパティを初期状態にする
    func setUpForUnitTest() {
        value = nil
        meAPI = MeAPI()
    }
    
    func injectionMeAPIMock(mock: MeAPIProtocol) {
        meAPI = mock
    }
}
#endif

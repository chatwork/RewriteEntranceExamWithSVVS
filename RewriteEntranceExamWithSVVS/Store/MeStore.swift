//
//  MeStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

@MainActor
final class MeStore {
    static let shared: MeStore = .init()
    
    @Published private(set) var value: Me?
    
    private var meRepository: MeRepositoryProtocol = MeRepository()
    
    func fetch(token: ChatworkAPIToken) async throws {
        let fetchResult = try await meRepository.fetch(token: token)
        value = fetchResult
    }
}

// ユニットテスト用のメソッド
extension MeStore {
    // プロパティを初期状態にする
    func setUpForUnitTest() {
        value = nil
        meRepository = MeRepository()
    }
    
    func injectionMeRepositoryMock(mock: MeRepositoryProtocol) {
        meRepository = mock
    }
}

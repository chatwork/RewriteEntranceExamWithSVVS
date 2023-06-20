//
//  ChatworkAPITokenStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import Foundation

@MainActor
final class ChatworkAPITokenStore {
    static let shared: ChatworkAPITokenStore = .init()
    
    // load()と関連づけたコンピューテッドプロパティの方がいいんじゃない？
    // → .sink出来なくなるからやっぱりこのままがよさそう
    @Published private(set) var value: ChatworkAPIToken?
    
    init() {
        self.load()
    }
    
    let repository = ChatworkAPITokenManager()
    
    func load() {
        value = repository.load()
    }
    
    func save(tokenData: ChatworkAPIToken) {
        repository.save(tokenData: tokenData)
        load()
    }
    
    func delete() {
        repository.delete()
        load()
    }
}

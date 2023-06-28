//
//  ChatworkAPITokenStore.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/09.
//

import Foundation
import ChatworkAPI

@MainActor
public final class ChatworkAPITokenStore {
    public static let shared: ChatworkAPITokenStore = .init()
    
    // load()と関連づけたコンピューテッドプロパティの方がいいんじゃない？
    // → .sink出来なくなるからやっぱりこのままがよさそう
    @Published public private(set) var value: ChatworkAPIToken?
    
    public init() {
        self.load()
    }
    
    private let repository = ChatworkAPITokenManager()
    
    public func load() {
        value = repository.load()
    }
    
    public func save(tokenData: ChatworkAPIToken) {
        repository.save(tokenData: tokenData)
        load()
    }
    
    public func delete() {
        repository.delete()
        load()
    }
}

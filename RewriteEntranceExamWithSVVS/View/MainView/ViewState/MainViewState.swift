//
//  MainViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import Combine
import Foundation

@MainActor
final class MainViewState: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        ChatworkAPITokenStore.shared.$value
            .sink { token in
                if token == nil {
                    self.returnLoginViewSubject.send()
                }
            }
            .store(in: &cancellables)
    }
    
    // 画面遷移のsendをするためのPublisher
    private let returnLoginViewSubject = PassthroughSubject<Void, Never>()
    var returnLoginView: AnyPublisher<Void, Never> {
        returnLoginViewSubject.eraseToAnyPublisher()
    }
}

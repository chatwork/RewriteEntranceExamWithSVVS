//
//  AccountViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import Combine
import Foundation

@MainActor
final class AccountViewState: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var logoutAlertFlag = false
    @Published private(set) var me: Me?
    
    init() {
        MeStore.shared.$value
            .sink { me in
                if let me {
                    self.me = me
                }
            }
            .store(in: &cancellables)
    }
    
    // ログアウトのアラートを表示する処理
    func displayLogoutAlert() {
        self.logoutAlertFlag = true
    }
    
    // アラートの「ログアウトボタンの処理」
    func onTapAlertLogoutButton() {
        ChatworkAPITokenStore.shared.delete()
    }
    
    // 自動ログインで入ってきた時にfetchMe()をしないとMeの情報が未取得になっている
    func fetchMe() async {
        let token = ChatworkAPITokenStore.shared.value!
        do {
            try await MeStore.shared.fetch(token: token)
        } catch {
            // TODO: 例外処理
        }
    }
}

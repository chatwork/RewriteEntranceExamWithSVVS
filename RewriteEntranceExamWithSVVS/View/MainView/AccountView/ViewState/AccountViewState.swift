//
//  AccountViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import Foundation

@MainActor
final class AccountViewState: ObservableObject {
    @Published var logoutAlertFlag = false
    
    // ログアウトのアラートを表示する処理
    func displayLogoutAlert() {
        self.logoutAlertFlag = true
    }
    
    // アラートの「ログアウトボタンの処理」
    func onTapAlertLogoutButton() {
        ChatworkAPITokenStore.shared.delete()
    }
}

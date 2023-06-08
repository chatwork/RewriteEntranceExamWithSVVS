//
//  LoginViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

@MainActor
final class LoginViewState: ObservableObject {
    @Published var inputToken: String = ""
    @Published var loginFailedAlertFlag = false
    
    func onTapLoginButton() async {
        do {
            try await MeStore.shared.fetch(token: inputToken)
            // TODO: 例外がない場合、画面を遷移させる
            print("ログイン成功")
        } catch {
            loginFailedAlertFlag = true
        }
    }
    
    func onTapAlertCloseButton() {
        loginFailedAlertFlag = false
    }
}

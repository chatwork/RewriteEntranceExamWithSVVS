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
    
    func onTapLoginButton() async {
        do {
            try await MeStore.shared.fetch(token: inputToken)
            // 例外がない場合、画面を遷移させる
            print("ログイン成功")
        } catch {
            // TODO: 例外のアラートなど
            print("ログイン失敗")
        }
    }
}

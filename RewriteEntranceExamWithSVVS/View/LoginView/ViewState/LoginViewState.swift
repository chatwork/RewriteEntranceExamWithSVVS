//
//  LoginViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Combine
import Foundation
import UIKit
import ChatworkAPI

@MainActor
final class LoginViewState: ObservableObject {
    // Viewからの入力値
    @Published var inputToken: String = ""
    // ログイン失敗時のアラートをViewへ伝えるフラグ
    @Published var loginFailedAlertFlag = false
    
    func onTapLoginButton() async {
        do {
            // 入力されたトークンを値オブジェクトに変換・ダメなら例外出す
            let valueObjectToken = try ChatworkAPIToken(value: inputToken)
            // リクエストの依頼・失敗は例外出す
            try await MeStore.shared.fetch(token: valueObjectToken)
            // 成功だからトークンをKeychainに保存する
            ChatworkAPITokenStore.shared.save(tokenData: valueObjectToken)
            // 例外起きなければ画面遷移
            toRoomListViewSubject.send()
        } catch {
            // アラート表示フラグを立てる
            loginFailedAlertFlag = true
        }
    }
    
    // 初回ログイン(トークン未保存)かどうかを判定する
    func checkFirstLogin() {
        let savedToken = ChatworkAPITokenStore.shared.value
        // 初回ログイン出ないなら遷移させる
        if savedToken != nil {
            toRoomListViewSubject.send()
            return
        }
    }
    
    // アラート表示フラグを消す
    func onTapAlertCloseButton() {
        loginFailedAlertFlag = false
    }
    
    // 画面遷移のsendをするためのPublisher
    private let toRoomListViewSubject = PassthroughSubject<Void, Never>()
    var toRoomListView: AnyPublisher<Void, Never> {
        toRoomListViewSubject.eraseToAnyPublisher()
    }
}

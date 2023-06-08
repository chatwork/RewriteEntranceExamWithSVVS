//
//  LoginViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation
import UIKit

@MainActor
final class LoginViewState: ObservableObject {
    @Published var inputToken: String = ""
    @Published var loginFailedAlertFlag = false
    
    // 画面遷移に使うための「SwiftUIをホスティングしているViewController」
    private var rootVC: UIViewController?
    
    // 引数を取ってしまうが画面遷移のためのプロパティを用意するために必要
    func setRootVC(rootVC: UIViewController) {
        self.rootVC = rootVC
    }
    
    func onTapLoginButton() async {
        do {
            // 入力されたトークンを値オブジェクトに変換・ダメなら例外出す
            let valueObjectToken = try ChatworkAPIToken(value: inputToken)
            // リクエストの依頼・失敗は例外出す
            try await MeStore.shared.fetch(token: valueObjectToken)
            // 例外起きなければ画面遷移
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "room_list_view")
            rootVC?.present(nextVC, animated: false, completion: nil)
        } catch {
            // アラート表示フラグを立てる
            loginFailedAlertFlag = true
        }
    }
    
    // アラート表示フラグを消す
    func onTapAlertCloseButton() {
        loginFailedAlertFlag = false
    }
}

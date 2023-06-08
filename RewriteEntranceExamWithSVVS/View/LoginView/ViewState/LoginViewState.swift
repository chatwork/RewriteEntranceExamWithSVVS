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
    
    private var rootVC: UIViewController? = nil
    
    // 引数を取ってしまうが画面遷移のためのプロパティを用意するために必要
    func setRootVC(rootVC: UIViewController) {
        self.rootVC = rootVC
        print("set")
    }
    
    func onTapLoginButton() async {
        do {
            try await MeStore.shared.fetch(token: inputToken)
            print("成功")
            print(rootVC)
            // TODO: 例外がない場合、画面を遷移させる
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "room_list_view")
            rootVC?.present(nextVC, animated: true, completion: nil)
        } catch {
            loginFailedAlertFlag = true
        }
    }
    
    func onTapAlertCloseButton() {
        loginFailedAlertFlag = false
    }
}

//
//  LoginButton.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import SwiftUI

struct LoginButton: View {
    @StateObject private var state: LoginViewState
    
    init(state: LoginViewState) {
        self._state = .init(wrappedValue: state)
    }
    
    var body: some View {
        Button {
            /*
             TODO: (検討)
                サンプルコードではView内でTaskで非同期コンテキストを作ってたから
                ここに書いたけど、ViewStateに移動させた方が見た目はスッキリしそう？
             */
            Task {
                await state.onTapLoginButton()
            }
        } label: {
            Text("ログイン")
        }

    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(state: LoginViewState())
    }
}

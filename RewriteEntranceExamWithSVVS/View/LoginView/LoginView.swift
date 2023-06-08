//
//  LoginView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var state: LoginViewState = .init()
    
    var body: some View {
        VStack {
            Spacer()
            InputTokenField(state: state)
                .padding(.bottom, 24)
            LoginButton(state: state)
            Spacer()
        }
        .alert("ログインに失敗しました", isPresented: $state.loginFailedAlertFlag) {
            Button {
                state.onTapAlertCloseButton()
            } label: {
                Text("閉じる")
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

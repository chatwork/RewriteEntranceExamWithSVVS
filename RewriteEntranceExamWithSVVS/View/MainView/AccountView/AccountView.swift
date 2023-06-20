//
//  AccountView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var state: AccountViewState = .init()
    
    var body: some View {
        VStack {
            if state.me != nil {
                AccountInfoView(me: state.me!) // swiftlint:disable:this force_unwrapping
            }
            
            // ログアウトボタン
            Button {
                state.displayLogoutAlert()
            } label: {
                Text("ログアウト")
            }
        }
        .task {
            await state.fetchMe()
        }
        .alert("ログアウトしますか？", isPresented: $state.logoutAlertFlag) {
            Button("キャンセル", role: .cancel) {}
            Button("ログアウト", role: .destructive) {
                state.onTapAlertLogoutButton()
            }
        }
        .alert("情報の取得に失敗しました", isPresented: $state.failedFetchMeFlag) {
            Button("再取得") {
                Task {
                    await state.fetchMe()
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

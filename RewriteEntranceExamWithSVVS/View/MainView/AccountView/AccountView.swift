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
            // ログアウトボタン
            Button {
                state.displayLogoutAlert()
            } label: {
                Text("ログアウト")
            }
        }
        .alert("ログアウトしますか？", isPresented: $state.logoutAlertFlag) {
            Button("キャンセル", role: .cancel) {}
            Button("ログアウト", role: .destructive) {
                state.onTapAlertLogoutButton()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

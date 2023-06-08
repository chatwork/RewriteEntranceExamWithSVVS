//
//  LoginFailedAlert.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import SwiftUI

struct LoginFailedAlert: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    @StateObject private var state: LoginViewState
    
    init(state: LoginViewState) {
        self._state = .init(wrappedValue: state)
    }
    
    // UIのデザインはこだわらなくて良いとのことなのでざっくりと機能だけ
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            VStack(spacing: 20) {
                Text("ログインに失敗しました")
                Button {
                    
                } label: {
                    Text("閉じる")
                }

            }
            .frame(
                width: width * 0.6,
                height: width * 0.4
            )
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
        )
        }
        .frame(
            width: width,
            height: height
        )
    }
}

struct LoginFailedAlert_Previews: PreviewProvider {
    static var previews: some View {
        LoginFailedAlert(state: LoginViewState())
    }
}

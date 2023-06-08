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

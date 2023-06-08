//
//  InputTokenField.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import SwiftUI

struct InputTokenField: View {
    @StateObject private var state: LoginViewState
    
    init(state: LoginViewState) {
        self._state = .init(wrappedValue: state)
    }
    
    var body: some View {
        TextField(
            "Chatwork APIのトークンを入力してください",
            text: $state.inputToken
        )
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 16)
    }
}

struct InputTokenField_Previews: PreviewProvider {
    static var previews: some View {
        InputTokenField(state: LoginViewState())
    }
}

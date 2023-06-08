//
//  LoginViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

@MainActor
final class LoginViewState: ObservableObject {
    @Published var inputToken: String = ""
}

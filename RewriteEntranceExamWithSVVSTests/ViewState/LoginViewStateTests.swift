//
//  LoginViewStateTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import XCTest

@MainActor
final class LoginViewStateTests: XCTestCase {
    func test_ログイン失敗時にフラグが立つ() async throws {
        let state = LoginViewState()
        await state.onTapLoginButton()
        
        XCTAssertEqual(state.loginFailedAlertFlag, true)
    }
    
    func test_ログイン成功時にフラグが立たない() async throws {
        let state = LoginViewState()
        state.inputToken = "input your token"
        await state.onTapLoginButton()
        
        XCTAssertEqual(state.loginFailedAlertFlag, false)
    }
}

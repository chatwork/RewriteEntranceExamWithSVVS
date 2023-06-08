//
//  ChatworkAPITokenTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import XCTest

final class ChatworkAPITokenTests: XCTestCase {
    func test_英数字のみを与えた場合_初期化される() throws {
        do {
            let tokenString = "token1234"
            let token = try ChatworkAPIToken(value: tokenString)
            XCTAssertEqual(token.value, tokenString)
        } catch {
            XCTFail("予期せぬ例外が起きました")
        }
    }
    
    func test_英数字以外が混ざったものを与えた場合_例外が起きる() throws {
        do {
            let tokenString = "token1234あいうえお"
            let token = try ChatworkAPIToken(value: tokenString)
            XCTFail("予期した例外が起きませんでした")
        } catch {
            XCTAssertEqual(error as! ValueObjectError, ValueObjectError.invalidValue)
        }
    }
    
    func test_空文字を与えた場合_例外が起きる() throws {
        do {
            let tokenString = ""
            let token = try ChatworkAPIToken(value: tokenString)
            XCTFail("予期した例外が起きませんでした")
        } catch {
            XCTAssertEqual(error as! ValueObjectError, ValueObjectError.invalidValue)
        }
    }
}

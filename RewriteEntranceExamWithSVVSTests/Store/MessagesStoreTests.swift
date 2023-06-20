//
//  MessagesStoreTests.swift
//  RewriteEntranceExamWithSVVSTests
//
//  Created by cw-ryu.nakayama on 2023/06/20.
//

import XCTest

/*
 MessagesStoreは現状、RoomMessageAPIをラップしてるだけなので
 RoomMessageAPIがテストできてるなら、このテストを書く意味が薄そう
 ということで、現状は書かない
 */
final class MessagesStoreTests: XCTestCase {
    let token = KeyManager().getValue(key: "ChatworkAPIToken") as! String

}

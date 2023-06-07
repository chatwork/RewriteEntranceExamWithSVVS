//
//  ChatworkAPIURL.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import Foundation

struct ChatworkAPIURL {
    static private let url = "https://api.chatwork.com/v2/me"
    
    static var getURL: URL {
        return URL(string: url)!
    }
}

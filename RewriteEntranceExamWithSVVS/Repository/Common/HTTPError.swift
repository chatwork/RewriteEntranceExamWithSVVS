//
//  HTTPError.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/07.
//

import Foundation

enum HTTPError: Error {
    // エラー内容で切り分けるのはとりあえず考えない
    // 200かそうでないかだけで一旦置いておく
    case statusCodeIsNot200
}

//
//  ValueObjectError.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

enum ValueObjectError: Error {
    // その値オブジェクトの求める値に違反した場合
    case invalidValue
}

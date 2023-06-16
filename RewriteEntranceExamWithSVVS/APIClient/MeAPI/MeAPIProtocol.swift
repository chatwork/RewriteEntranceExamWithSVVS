//
//  MeAPIProtocol.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

protocol MeAPIProtocol {
    func fetch(token: ChatworkAPIToken) async throws -> Me
}

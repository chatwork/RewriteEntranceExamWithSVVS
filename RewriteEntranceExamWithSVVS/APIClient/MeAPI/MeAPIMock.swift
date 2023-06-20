//
//  MeAPIMock.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

enum MeAPIMock: MeAPIProtocol {
    case successFetch
    case throwStatusCodeIsNot200
    case throwFailedToDecodeModel
    
    func fetch(token: ChatworkAPIToken) async throws -> Me {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        switch self {
        case .successFetch:
            return me
        case .throwStatusCodeIsNot200:
            throw APIError.statusCodeIsNot200
        case .throwFailedToDecodeModel:
            throw APIError.failedToDecodeModel
        }
    }
    
    // 返す仮データ
    private var me: Me {
        Me(
            accountId: 0,
            roomId: 0,
            name: "Test User",
            chatworkId: "Test_User",
            organizationId: 0,
            organizationName: "Test",
            department: "TestDepartment",
            title: "Test",
            url: "___",
            introduction: "test",
            mail: "test@test.com",
            telOrganization: "test",
            telExtension: "test",
            telMobile: "test",
            skype: "test",
            facebook: "test",
            twitter: "test",
            avatarImageUrl: "Test",
            loginMail: "Test@test.com"
        )
    }
}

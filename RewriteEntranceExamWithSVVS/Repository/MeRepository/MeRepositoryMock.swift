//
//  MeRepositoryMock.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Foundation

struct MeRepositoryMock: MeRepositoryProtocol {
    let me = Me(
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
    
    func fetch(token: String) async throws -> Me {
        try? await Task.sleep(nanoseconds: 1000000)
        return me
    }
}

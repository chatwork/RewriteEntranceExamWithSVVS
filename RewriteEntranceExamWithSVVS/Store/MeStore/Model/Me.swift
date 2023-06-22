//
//  Me.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/06.
//

import Foundation
import ChatworkAPI

struct Me {
    let accountId: Int
    let roomId: Int
    let name: String
    let chatworkId: String
    let organizationId: Int
    let organizationName: String
    let department: String
    let title: String
    let url: String
    let introduction: String
    let mail: String
    let telOrganization: String
    let telExtension: String
    let telMobile: String
    let skype: String
    let facebook: String
    let twitter: String
    let avatarImageUrl: String
    let loginMail: String
    
    static func comvert(from: MeGetResponse) -> Me {
        Me(
            accountId: from.accountId,
            roomId: from.roomId,
            name: from.name,
            chatworkId: from.chatworkId,
            organizationId: from.organizationId,
            organizationName: from.organizationName,
            department: from.department,
            title: from.title,
            url: from.url,
            introduction: from.introduction,
            mail: from.mail,
            telOrganization: from.telOrganization,
            telExtension: from.telExtension,
            telMobile: from.telMobile,
            skype: from.skype,
            facebook: from.facebook,
            twitter: from.twitter,
            avatarImageUrl: from.avatarImageUrl,
            loginMail: from.loginMail
        )
    }
}

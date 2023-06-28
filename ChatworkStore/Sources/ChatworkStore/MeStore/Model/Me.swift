//
//  Me.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/06.
//

import ChatworkAPI
import Foundation

public struct Me {
    public let accountId: Int
    public let roomId: Int
    public let name: String
    public let chatworkId: String
    public let organizationId: Int
    public let organizationName: String
    public let department: String
    public let title: String
    public let url: String
    public let introduction: String
    public let mail: String
    public let telOrganization: String
    public let telExtension: String
    public let telMobile: String
    public let skype: String
    public let facebook: String
    public let twitter: String
    public let avatarImageUrl: String
    public let loginMail: String
    
    public init(accountId: Int, roomId: Int, name: String, chatworkId: String, organizationId: Int, organizationName: String, department: String, title: String, url: String, introduction: String, mail: String, telOrganization: String, telExtension: String, telMobile: String, skype: String, facebook: String, twitter: String, avatarImageUrl: String, loginMail: String) {
        self.accountId = accountId
        self.roomId = roomId
        self.name = name
        self.chatworkId = chatworkId
        self.organizationId = organizationId
        self.organizationName = organizationName
        self.department = department
        self.title = title
        self.url = url
        self.introduction = introduction
        self.mail = mail
        self.telOrganization = telOrganization
        self.telExtension = telExtension
        self.telMobile = telMobile
        self.skype = skype
        self.facebook = facebook
        self.twitter = twitter
        self.avatarImageUrl = avatarImageUrl
        self.loginMail = loginMail
    }
    
    public static func comvert(from: MeGetResponse) -> Me {
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

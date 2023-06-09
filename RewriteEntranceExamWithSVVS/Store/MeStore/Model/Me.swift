//
//  Me.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/06.
//

import Foundation

// GlobalStateであるMeをDecodableに準拠させるのは責務的に大丈夫なのだろうか？と心配している
struct Me: Decodable {
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
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case roomId = "room_id"
        case name = "name"
        case chatworkId = "chatwork_id"
        case organizationId = "organization_id"
        case organizationName = "organization_name"
        case department = "department"
        case title = "title"
        case url = "url"
        case introduction = "introduction"
        case mail = "mail"
        case telOrganization = "tel_organization"
        case telExtension = "tel_extension"
        case telMobile = "tel_mobile"
        case skype = "skype"
        case facebook = "facebook"
        case twitter = "twitter"
        case avatarImageUrl = "avatar_image_url"
        case loginMail = "login_mail"
    }
}

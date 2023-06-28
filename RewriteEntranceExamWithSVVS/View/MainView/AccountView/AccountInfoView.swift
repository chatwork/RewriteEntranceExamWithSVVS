//
//  AccountInfoView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/15.
//

import SwiftUI
import ChatworkStore

struct AccountInfoView: View {
    private let me: Me
    
    init(me: Me) {
        self.me = me
    }
    
    let frameWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    ZStack {
                        Color.red
                        Text("背景画像")
                    }
                    HStack {
                        AsyncImage(url: URL(string: me.avatarImageUrl)) { image in
                            image.image?.resizable()
                            
                        }
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: frameWidth * 0.16)
                        .padding(16)
                        
                        Spacer()
                    }
                }
                .frame(height: frameWidth * 0.4)
                
                VStack {
                    HStack {
                        Text("\(me.name)")
                            .font(.body)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Chatwork ID :  \(me.chatworkId)")
                            .font(.caption2)
                        
                        Spacer()
                    }
                }
                .padding(.leading, 8)
                
                Divider()
                     
                VStack(spacing: 8) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("組織名 :")
                                .font(.caption2)
                            Text("\(me.organizationName)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("所属 :")
                                .font(.caption2)
                            Text("\(me.department)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("役職 :")
                                .font(.caption2)
                            Text("\(me.title)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("URL :")
                                .font(.caption2)
                            Text("\(me.url)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("メールアドレス :")
                                .font(.caption2)
                            Text("\(me.mail)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("電話番号(勤務先) :")
                                .font(.caption2)
                            Text("\(me.telOrganization)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("電話番号(内線) :")
                                .font(.caption2)
                            Text("\(me.telExtension)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("電話番号(携帯) :")
                                .font(.caption2)
                            Text("\(me.telMobile)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 8)
                
                Spacer()
            }
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static let me = Me(
        accountId: 0,
        roomId: 0,
        name: "test_name",
        chatworkId: "cw_id_1234",
        organizationId: 0,
        organizationName: "テスト株式会社",
        department: "",
        title: "",
        url: "",
        introduction: "",
        mail: "",
        telOrganization: "",
        telExtension: "",
        telMobile: "",
        skype: "",
        facebook: "",
        twitter: "",
        avatarImageUrl: "https://appdata.chatwork.com/avatar/5AdpyKvpA2.rsz.png",
        loginMail: ""
    )
    
    static var previews: some View {
        AccountInfoView(me: Self.me)
    }
}

//
//  MainView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            // ルーム一覧のタブ
            RoomListView()
                .tabItem {
                    VStack {
                        Image(systemName: "text.bubble.fill")
                        Text("チャット")
                    }
                }
            // アカウント関連のタブ
            AccountView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("アカウント")
                    }
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

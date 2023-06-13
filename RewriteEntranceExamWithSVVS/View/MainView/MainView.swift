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
            RoomListView()
                .tabItem {
                    VStack {
                        Image(systemName: "text.bubble.fill")
                        Text("チャット")
                    }
                }
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

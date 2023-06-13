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
                    Image(systemName: "1.circle.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

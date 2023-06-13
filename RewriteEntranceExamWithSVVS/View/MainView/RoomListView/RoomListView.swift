//
//  RoomListView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import SwiftUI

struct RoomListView: View {
    @StateObject private var state: RoomListViewState = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(state.roomList) { room in
                            RoomListCell(roomInfo: room)
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle("ルーム一覧", displayMode: .inline)
        }
        .alert("ルーム情報の取得に失敗しました", isPresented: $state.failedfetchRoomListAlertFlag) {
            // ここの挙動を確認するには...
            //  1. ログインする
            //  2. アプリを落とす
            //  3. ネット接続のない状態で自動ログインでアプリを起動する
            Button("再読み込み") {
                state.onTapFailedfetchRoomListAlertButton()
            }
        }
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}

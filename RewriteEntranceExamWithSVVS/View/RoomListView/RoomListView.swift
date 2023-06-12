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
        
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}

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
        VStack(spacing: 0) {
            ForEach(state.roomList) { room in
                RoomListCell(roomInfo: room)
            }
        }
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}

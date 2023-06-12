//
//  RoomListCell.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import SwiftUI

struct RoomListCell: View {
    private let roomInfo: RoomListViewState.RoomInfo
    
    init(roomInfo: RoomListViewState.RoomInfo) {
        self.roomInfo = roomInfo
    }
    
    var body: some View {
        HStack {
            Text("\(roomInfo.name)")
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .background(
            .white
        )
        .border(.black, width: 0.2)
    }
}

struct RoomListCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RoomListCell(roomInfo: .init(roomId: 0, name: "テスト", sticky: false, unreadNum: 0, mentionNum: 0))
        }
    }
}

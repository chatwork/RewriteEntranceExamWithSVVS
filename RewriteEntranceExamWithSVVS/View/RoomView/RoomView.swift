//
//  RoomView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import SwiftUI

struct RoomView: View {
    private let roomId: Int
    
    @StateObject private var state: RoomViewState
    
    init(roomId: Int) {
        self.roomId = roomId
        self._state = .init(wrappedValue: RoomViewState(roomId: roomId))
    }
    
    var body: some View {
        VStack {
            Text("メッセージを入力してください")
            TextField("", text: $state.message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                state.onTapSendButton()
            } label: {
                Text("送信")
            }

        }
        .navigationTitle(state.roomName)
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(roomId: 0)
    }
}

//
//  RoomView.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/12.
//

import SwiftUI
import ChatworkAPI

struct RoomView: View {
    // ルーム一覧画面から渡される
    private let roomId: Int
    
    @StateObject private var state: RoomViewState
    
    init(roomId: Int) {
        self.roomId = roomId
        self._state = .init(wrappedValue: RoomViewState(roomId: roomId))
        TestPackage().test()
    }
    
    var body: some View {
        VStack {
            Text("メッセージを入力してください")
            // メッセージ入力欄
            TextField("", text: $state.message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            // メッセージ送信ボタン
            Button {
                Task {
                    await state.onTapSendButton()
                }
            } label: {
                Text("送信")
            }
            .disabled(state.disabledSendButton)

        }
        .navigationTitle(state.roomName)
        .alert("メッセージ送信に失敗しました", isPresented: $state.failedSendMessageAlertFlag) {
            Button("キャンセル", role: .cancel) {}
            Button("再送信") {
                Task {
                    await state.onTapFailedAlertResendButton()
                }
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(roomId: 0)
    }
}

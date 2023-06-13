//
//  AccountViewState.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/13.
//

import Foundation

@MainActor
final class AccountViewState: ObservableObject {
    @Published var logoutAlertFlag = false
    
    func displayLogoutAlert() {
        self.logoutAlertFlag = true
    }
    
    func onTapAlertLogoutButton() {
        ChatworkAPITokenStore.shared.delete()
    }
}

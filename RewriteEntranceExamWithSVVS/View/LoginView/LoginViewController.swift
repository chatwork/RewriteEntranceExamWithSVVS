//
//  ViewController.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/05.
//

import Combine
import SwiftUI
import UIKit

class LoginViewController: UIViewController {
    private let viewState: LoginViewState = .init()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewState.toRoomListView.sink { [weak self] _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "main_view")
            self?.present(nextVC, animated: false, completion: nil)
        }
        .store(in: &cancellables)
        
        embedSwiftUIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        viewState.checkFirstLogin()
    }

    @IBOutlet private weak var swiftUIView: UIView!
    
    // SwiftUIViewの埋め込み
    private func embedSwiftUIView() {
        let viewController: UIHostingController<LoginView> = UIHostingController(rootView: LoginView(state: viewState))
        addChild(viewController)

        swiftUIView.addSubview(viewController.view)

        viewController.didMove(toParent: self)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.widthAnchor.constraint(
                equalTo: swiftUIView.widthAnchor,
                multiplier: 1
            ),
            viewController.view.heightAnchor.constraint(
                equalTo: swiftUIView.heightAnchor,
                multiplier: 1
            ),
            viewController.view.centerXAnchor.constraint(
                equalTo: swiftUIView.centerXAnchor
            ),
            viewController.view.centerYAnchor.constraint(
                equalTo: swiftUIView.centerYAnchor
            )
        ])
    }
}

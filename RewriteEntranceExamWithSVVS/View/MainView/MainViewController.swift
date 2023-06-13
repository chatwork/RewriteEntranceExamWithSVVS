//
//  RoomListViewController.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/08.
//

import Combine
import SwiftUI
import UIKit

class MainViewController: UIViewController {
    private var viewState: MainViewState = .init()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        viewState.returnLoginView
            .sink { [weak self] _ in
                self?.dismiss(animated: false, completion: nil)
            }
            .store(in: &cancellables)
        
        embedSwiftUIView()
    }
    
    @IBOutlet private weak var swiftUIView: UIView!
    
    // SwiftUIViewの埋め込み
    private func embedSwiftUIView() {
        let viewController: UIHostingController<MainView> = UIHostingController(rootView: MainView())
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

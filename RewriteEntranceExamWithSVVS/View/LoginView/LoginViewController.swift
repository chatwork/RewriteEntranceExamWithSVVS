//
//  ViewController.swift
//  RewriteEntranceExamWithSVVS
//
//  Created by cw-ryu.nakayama on 2023/06/05.
//

import SwiftUI
import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        embedSwiftUIView()
    }

    @IBOutlet private weak var swiftUIView: UIView!
    
    // SwiftUIViewの埋め込み
    private func embedSwiftUIView() {
        let viewController: UIHostingController<LoginView> = UIHostingController(rootView: LoginView())
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

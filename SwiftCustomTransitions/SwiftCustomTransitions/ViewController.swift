//
//  ViewController.swift
//  SwiftCustomTransitions
//
//  Created by Paolo Prodossimo Lopes on 03/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let openNewViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("O P E N", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonHandleTapped(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    private func configureButton() {
        view.addSubview(openNewViewButton)
        openNewViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openNewViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        openNewViewButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc private func buttonHandleTapped(_ sender: UIButton) {
        let viewController = SecondViewController()
        let customTransitions = InteractiveModalTransitioningDelegate(from: self, to: viewController)
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = customTransitions
        present(viewController, animated: true, completion: nil)
    }
}


final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

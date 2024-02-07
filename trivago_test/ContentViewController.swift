//
//  ContentViewController.swift
//  trivago_test
//
//  Created by Patrick on 2/7/24.
//

import UIKit
import SwiftUI



class ContentViewController: UIViewController {
    
    private var buttonHostingController: UIHostingController<BrandButton>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationBar()
        setupCenterTextLabel()
        setupButton()
    }
    
    private func setupNavigationBar() {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        let navigationItem = UINavigationItem(title: "Button Test")
        navigationBar.setItems([navigationItem], animated: false)
        view.addSubview(navigationBar)
        
        // Auto Layout constraints
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupCenterTextLabel() {
        let label = UILabel()
        label.text = "Click the Button below"
        label.textAlignment = .center
        view.addSubview(label)
        
        // Auto Layout constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupButton() {
        // Initialize the SwiftUI view
        let brandButton = BrandButton(
            type: .secondary,
            color: .green,
            disabled: false,
            action: {},
            label: "Click me",
            leadingImage: Image(systemName: "square"),
            trailingImage: Image(systemName: "square")
        )
        
        // Create a UIHostingController to wrap the SwiftUI view
        buttonHostingController = UIHostingController(rootView: brandButton)
        addChild(buttonHostingController)
        view.addSubview(buttonHostingController.view)
        buttonHostingController.didMove(toParent: self)
        
        // Auto Layout constraints
        let buttonView = buttonHostingController.view!
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 44),
            buttonView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            buttonView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
}



// Preview ContentViewController in SwiftUI Preview

// Create a UIViewControllerRepresentable
struct ContentViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ContentViewController {
        return ContentViewController()
    }
    
    func updateUIViewController(_ uiViewController: ContentViewController, context: Context) {
        // Update view if needed
    }
}

struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewControllerRepresentable()
    }
}

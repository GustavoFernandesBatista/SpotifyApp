//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Gustavo Fernandes on 15/06/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign in with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
            
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20,
                                    y: view.height-50-view.safeAreaInsets.bottom,
                                    width: view.width-40,
                                    height: 50
        )
    }
    
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { sucesss in
            DispatchQueue.main.async {
                self.handleSignIn(sucess: sucesss)
            }

        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(sucess: Bool) {
        
        // faça login do usuário ou mostre para ele um erro
    }
    }


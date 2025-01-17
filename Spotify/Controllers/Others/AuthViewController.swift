//
//  AuthViewController.swift
//  Spotify
//
//  Created by Gustavo Fernandes on 15/06/24.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate{

    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
                                configuration: config)

        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let url = AuthManager.shared.signInURL else {
            return
        }
        webView.load(URLRequest (url:url))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame =  view.bounds
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        // exchange the code for access token
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name == "code" })?.value else {
            return
        }
        
        print("Code : \(code)")
    }
}

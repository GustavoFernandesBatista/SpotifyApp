//
//  AuthManager.swift
//  Spotify
//
//  Created by Gustavo Fernandes on 15/06/24.
//

import Foundation


final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "2745dfb2a6b94cd2b3bbaadc851d9cea"
        static let clientSecrets = "6d0430dcefef45ad8ade161053f9245b"
        
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.instagram.com/"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&foo&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
        
    }
    
    
    var isSignedIn: Bool {
        
        
        return false
    }
    private var acessToken: String? {
        
        return nil
    }
    private var refreshToken: String?{
        
        return nil
    }
    private var tokenExpirationDate: Date? {
        
        return nil
    }
    
    private var shouldRefreshToken: Bool{
        
        return false
    }
    
    public func exchangeCodeForToken(
    code: String,
    completion: @escaping ((Bool) -> Void)) {
        
        // get token
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
}

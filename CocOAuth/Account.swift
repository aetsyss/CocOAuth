//
//  Account.swift
//  CocOAuth
//
//  Created by Marko Seifert on 08.12.15.
//  Copyright © 2015 CocOAuth. All rights reserved.
//

import Foundation

public class Account{
    
    public typealias CompletionHandler = () -> ()
    //public typealias DataTaskResult = () throws -> (NSData, NSURLResponse)
    
    let config:CocOAuthConfig
    let client:OAuth2Client
    
    enum CocOAuthError: ErrorType {
        case InvalidUserCredentialsError
        case OfflineError
        case TimeOutError
        case TechnicalError
    }
    public init(config:CocOAuthConfig){
        self.config = config
        client = OAuth2Client(config: config)
    }
    /**
    * Performs the authentication with resource owner password credentials.
    * This method is asynchronous. Use the completionHandler block to handle success or error.
    *
    * @param username
    *          the OAuth2 username
    *
    * @paramter password
    *          the OAuth2 password
    *
    * @param completionHandler block
    */
    public func authenticateWithUsername(username:String,password :String, handler : CompletionHandler) -> Void {
        
        client.requestOAuthTokenWithUsername(username, password: password, handler: handler)
        
    }
}
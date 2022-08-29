//
//  NetworkService.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation
import Firebase

protocol NetworkServiceProtocol {
    func verificationIDRequest(phoneNumber: String, completion: @escaping (Result<String, Error>) -> Void)
    func login(verificationID: String, verificationCode: String, completion: @escaping (Bool) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func verificationIDRequest(phoneNumber: String, completion: @escaping (Result<String, Error>) -> Void) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let verificationID = verificationID else { return }
                completion(.success(verificationID))
                self.login(verificationID: verificationID, verificationCode: "123456") { result in
                    return
                }
            }
    }
    
    func login(verificationID: String, verificationCode: String, completion: @escaping (Bool) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: verificationID,
          verificationCode: verificationCode
        )

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                let authError = error as NSError
                print("Error authentification", authError)
                completion(false)
            }
            if authResult != nil {
                completion(true)
            }
        }
    }
}

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
            }
    }
}

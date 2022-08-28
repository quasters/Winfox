//
//  PasswordVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol PasswordViewModelInput {
    //var phoneNumber: String { get }
}

final class PasswordVM: PasswordViewModelInput {
    let completion: (() -> Void)?
    
    private let phoneNumber: String
    private var verificationID: String?
    
    private let network: NetworkFetcherProtocol
    
    required init(login: String, network: NetworkFetcherProtocol = NetworkFetcher(), completion: (() -> Void)?) {
        self.completion = completion
        self.phoneNumber = login
        self.network = network
    }
    
    public func passwordRequest(response: @escaping (Bool) -> Void) {
        network.fetchID(phoneNumber: phoneNumber) { [weak self] verificationID in
            self?.verificationID = verificationID
            response(verificationID != nil)
        }
    }
}

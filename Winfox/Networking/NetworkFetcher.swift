//
//  NetworkFetcher.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol NetworkFetcherProtocol {
    func fetchID(phoneNumber: String, response: @escaping (String?) -> Void)
}

final class NetworkFetcher: NetworkFetcherProtocol {
    private var networkService: NetworkServiceProtocol
    
    required init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchID(phoneNumber: String, response: @escaping (String?) -> Void) {
        networkService.verificationIDRequest(phoneNumber: phoneNumber) { result in
            switch result  {
            case .success(let id):
                response(id)
            case .failure(let error):
                print("Error of getting verificationID:", error)
                response(nil)
            }
        }
    }
}

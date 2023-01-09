//
//  NetworkManager.swift
//  technicalTestMVP
//
//  Created by Rosepsi on 27/12/22.
//

import Alamofire


protocol NetworkManager {
    func getTransactions (completion: @escaping(Transactions) -> ())
}

class DefaultNetworkManager : NetworkManager {
    func getTransactions (completion: @escaping(Transactions) -> ()) {
        AF.request("https://bamboocode.com/orange.json", method: .get).validate(statusCode: 200...299).responseDecodable(of:Transactions.self){response in
            if let transactions = response.value {
                  completion (transactions)
            } else {
                completion ([])
            }
        }
    }
}

//
//  networkManagerMock.swift
//  technicalTestMVPTests
//
//  Created by Rosepsi on 3/1/23.
//

import XCTest
@testable import technicalTestMVP

class NetworkManagerMock:NetworkManager {
    
    var forceError: Bool = false // variable para forzar el error
    
    static func createDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
        
    func getTransactions(completion: @escaping (technicalTestMVP.Transactions) -> ()) {
        if forceError {
            // si queremos forzar el error devolvemos un resultado que provoque errores
            completion([])
        } else {
            let dateFormatter = Self.createDateFormatter()
            completion ([Transaction (id: 345,
                                      date: dateFormatter.date (from: "2022-05-04T10:04:27.000Z"),
                                      amount: 91.04,
                                      fee: 0,
                                      transactionDescription: ""),
                         Transaction (id: 2987,
                                      date: dateFormatter.date (from: "2022-08-24T10:04:27.000Z"),
                                      amount: 154.89,
                                      fee: -3.41,
                                      transactionDescription: "")])
        }
    }
}
    
    
   

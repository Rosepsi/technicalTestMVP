//
//  Model.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

struct Transaction: Codable {
    let id: Int
    let date: Date?
    let amount: Double
    let fee: Double?
    let transactionDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, date, amount, fee
        case transactionDescription = "description"
    }
}

typealias Transactions = [Transaction]


extension Transaction {
    
    static func createDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode (Int.self, forKey: .id)
        let date = try container.decode (String.self, forKey: .date)
        let dateFormatter = Self.createDateFormatter()
        self.date = dateFormatter.date (from: date)
        self.amount = try container.decode (Double.self, forKey: .amount)
        self.fee = try container.decodeIfPresent (Double.self, forKey: .fee)
        self.transactionDescription = try container.decodeIfPresent (String.self, forKey: .transactionDescription)
    }
}


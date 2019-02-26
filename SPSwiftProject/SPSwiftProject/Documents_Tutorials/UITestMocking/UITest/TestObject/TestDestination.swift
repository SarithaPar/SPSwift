//
//  TestDestination.swift
//  SPSwiftProjectUITests
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation

struct TestDestination: Codable {
    let page: AppPage
}

enum AppPage: Codable {
    case vip(TestAd)
    case srp(TestSearch)
}


extension AppPage {
    enum CodingError: Error { case decoding(String) }
    enum CodableKeys: String, CodingKey { case vip, srp }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodableKeys.self)
        
        if let ad = try? values.decode(TestAd.self, forKey: .vip) {
            self = .vip(ad)
            return
        } else if let search = try? values.decode(TestSearch.self, forKey: .srp) {
            self = .srp(search)
            return
        }
        
        throw CodingError.decoding("Decoding Failed. \(dump(values))")
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodableKeys.self)
        
        switch self {
        case let .vip(ad):
            try container.encode(ad, forKey: .vip)
        case let .srp(search):
            try container.encode(search, forKey: .srp)
        case .conversationList:
            try container.encode("conversationList", forKey: .conversationList)
        }
    }
}


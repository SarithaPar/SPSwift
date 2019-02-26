//
//  TestSearch.swift
//  SPSwiftProjectUITests
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation


struct TestSearch: Codable {
    let keyword: String?
    let locationId: String?
    let categoryId: String?
    let priceType: String?
    let ads: [TestAd]
    let distance: Double?
    var options = [String: String]()
    
    init(
        keyword: String? = nil,
        locationId: String? = nil,
        categoryId: String? = nil,
        priceType: String? = nil,
        distance: Double? = nil,
        ads: [TestAd]
        ) {
        self.keyword = keyword
        self.ads = ads
        self.locationId = locationId
        self.categoryId = categoryId
        self.priceType = priceType
        self.distance = distance
        if let locationId = locationId {
            self.options.updateValue(locationId, forKey: "locationId")
        }
        if let categoryId = categoryId {
            self.options.updateValue(categoryId, forKey: "categoryId")
        }
        if let priceType = priceType {
            self.options.updateValue(priceType, forKey: "priceType")
        }
    }
    
    init(numResults: Int = 20, options: [String: String]) {
        self.init(ads: (0..<numResults).map { TestAd(title: "Test Ad \($0)") })
        self.options = options
    }
}

//
//  AdUtility.swift
//  SPSwiftProjectUITests
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation

import XCTest

class AdUtility {

    func getCarAd(year: Int, millage: Int, transmission: String) -> TestAd {
        let countryname = CountryNameUtility().getCountryName()
        let year = String(year)
        let millage = String(millage)
        var categoryID: String = ""
        var canonicalYear: String = ""
        var canonicalMileage: String = ""
        var canonicalTransmission: String = ""
        var carAd: TestAd? = nil
        switch countryname {
        case "AU":
            categoryID = "9299"
            canonicalYear = "cars.caryear"
            canonicalMileage = "cars.carmileageinkms"
            canonicalTransmission = "cars.cartransmission"
        default:
            categoryID = "27"
            canonicalYear = "caryear"
            canonicalMileage = "carmileageinkms"
            canonicalTransmission = "cartransmission"
        }
        let adAttrbutes: [TestAdAttribute] = [TestAdAttribute(canonicalName: canonicalYear, canonicalValue: "1984", localizedValue: year),
                                              TestAdAttribute(canonicalName: canonicalMileage, canonicalValue: "1984", localizedValue: millage),
                                              TestAdAttribute(canonicalName: canonicalTransmission, canonicalValue: "bigbrother", localizedValue: transmission)]
        
        carAd = TestAd(categoryID: categoryID, attributes: adAttrbutes)
        
        return carAd!
    }
}

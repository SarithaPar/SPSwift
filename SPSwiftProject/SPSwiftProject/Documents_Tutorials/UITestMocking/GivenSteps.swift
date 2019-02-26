//
//  GivenSteps.swift
//  SPSwiftProject
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation
import XCTest

extension BaseUITest {

    func givenIAmOnSRPWithCarAdWithAttributes(count: Int, year: Int, millage: Int, transmission: String) {
        let carAd = AdUtility().getCarAd(year: year, millage: millage, transmission: transmission)
        DeepLink().jumpToSRP(search: TestSearch(ads: (0..<count).map { _ in carAd }))
    }
}

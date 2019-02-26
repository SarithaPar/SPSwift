//
//  SRPTests.swift
//  SPSwiftProject
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation

class SRPTests: BaseUITest {
    
    func testShowAutoAttributesOnSRPList() {
         runStep("I am on SRP with 'count:1' Car Ad with attributes 'year:1984', 'millage:198400', 'transmission:MANUAL'") { self.givenIAmOnSRPWithCarAdWithAttributes(count: 1, year: 1984, millage: 198400, transmission: "MANUAL") }
}


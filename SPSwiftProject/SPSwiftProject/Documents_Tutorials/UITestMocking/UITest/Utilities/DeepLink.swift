//
//  DeepLink.swift
//  SPSwiftProjectUITests
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

import Foundation

class DeepLink {
    func jumpToSRP(search: TestSearch? = nil) {
        if (search != nil) {
            UITest.performCommandNamed(AppCommands.setSearchResponse, object: search)
        }
        UITest.performCommandNamed(AppCommands.moveToPage, object: TestDestination(page: AppPage.srp(search ?? TestSearch(ads: [TestAd]()))))
    }
}

//
//  Atm+CoreDataProperties.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/26/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Atm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Atm> {
        return NSFetchRequest<Atm>(entityName: "Atm")
    }

    @NSManaged public var isFavorites: Bool
    @NSManaged public var fullAddressRu: String
    @NSManaged public var cityRU: String

}

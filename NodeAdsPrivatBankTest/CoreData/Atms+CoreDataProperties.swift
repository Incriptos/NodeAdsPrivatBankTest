//
//  Atms+CoreDataProperties.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/22/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Atms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Atms> {
        return NSFetchRequest<Atms>(entityName: "Atms")
    }

    @NSManaged public var cityRU: String?
    @NSManaged public var fri: String?
    @NSManaged public var fullAddressRu: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var latitude: String?
    @NSManaged public var mon: String?
    @NSManaged public var placeRu: String?
    @NSManaged public var sat: String?
    @NSManaged public var sun: String?
    @NSManaged public var thu: String?
    @NSManaged public var tue: String?
    @NSManaged public var wed: String?

}

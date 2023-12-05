//
//  CreateRoomEntity+CoreDataProperties.swift
//  
//
//  Created by Mayur Bobade on 04/12/23.
//
//

import Foundation
import CoreData


extension CreateRoomEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateRoomEntity> {
        return NSFetchRequest<CreateRoomEntity>(entityName: "CreateRoomEntity")
    }

    @NSManaged public var roomTypeName: String?
    @NSManaged public var shortCode: String?
    @NSManaged public var roomTypeInventory: String?
    @NSManaged public var firstBed: String?
    @NSManaged public var secondBed: String?
    @NSManaged public var thirdBed: String?
    @NSManaged public var maxOccupancy: String?
    @NSManaged public var adults: String?
    @NSManaged public var child: String?
    @NSManaged public var roomDescription: String?
    @NSManaged public var minThershold: String?
    @NSManaged public var baseRate: String?
    @NSManaged public var maxThershold: String?
    @NSManaged public var extraAdultRate: String?
    @NSManaged public var extraChildRate: String?

}

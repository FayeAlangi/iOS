
import CoreLocation
import ParseSwift
import Foundation

struct Task: ParseObject {

    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    //to find the current user's tasks
    var username : String?
    var title: String?
    var description: String?
    var image: ParseFile?
    var location: ParseGeoPoint? 
    var isComplete: Bool {
         return image != nil
    }

}


//
//  Place.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/20/23.
//

import Foundation

struct Place : Decodable {
    var name : String
    var address : String
    var city : String
    var state : String
    var zipCode : String
    var phoneNumber : String
    var placeImageUrl :  URL
    
}

struct PlaceResponse : Decodable {
    var results : [Place]
}

//
//  HavarsineDistance.swift
//  NearByCustomers
//
//  Created by Mona Qora on 1/28/20.
//  Copyright © 2020 Mona Qora. All rights reserved.
//

import UIKit

class HavarsineDistance {
    class func calculateDistanceBetweenTwoLocation(fLocationLat: Double, fLocationLon: Double, sLocationLat: Double, sLocationLon: Double, radius: Double = Earth.radius) -> Double {
        let haversin = { (angle: Double) -> Double in
            return (1 - cos(angle))/2
        }
        
        let arcHaversin = { (angle: Double) -> Double in
            return asin(sqrt(angle))
        }
        
        let degreeToRaduis = { (degree: Double) -> Double in
            return degree * Double.pi/180
        }
        
        let lat1 = degreeToRaduis(fLocationLat)
        let lon1 = degreeToRaduis(fLocationLon)
        let lat2 = degreeToRaduis(sLocationLat)
        let lon2 = degreeToRaduis(sLocationLon)
        
        let h = haversin (lat2 - lat1) + cos(lat1) * cos(lat2) * haversin(lon2 - lon1)
        let distance = 2 * radius * arcHaversin(h)
        
        return distance
    }
}

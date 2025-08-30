//
//  MKMapPoint+Equatable.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import MapKit

extension MKMapPoint: @retroactive Equatable {
    public static func == (lhs: MKMapPoint, rhs: MKMapPoint) -> Bool {
        lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}

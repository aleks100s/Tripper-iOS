//
//  Destination.swift
//  Tripper
//
//  Created by Alexander on 28.08.2025.
//

enum Destination: Hashable {
    case routesList
    case routeDetails(Route)
    case stepsList(Int64)
}

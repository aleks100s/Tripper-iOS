//
//  RouteDetailsModel.swift
//  iosApp
//
//  Created by Alexander on 25.08.2025.
//

import Foundation

@Observable
final class RouteDetailsModel {
    private(set) var state: RouteDetailsState

    init(route: Route) {
        state = RouteDetailsState(title: route.name)
    }
}

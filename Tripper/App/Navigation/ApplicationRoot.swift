//
//  ApplicationRoot.swift
//  Tripper
//
//  Created by Alexander on 28.08.2025.
//

import SwiftUI

struct ApplicationRoot: View {
    @State private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            RoutesListView(model: RoutesListModel())
                .navigationDestination(for: Destination.self, destination: navigate(to:))
        }
        .environment(router)
    }
    
    @ViewBuilder
    private func navigate(to destination: Destination) -> some View {
        switch destination {
        case .routesList:
            RoutesListView(model: RoutesListModel())
        case .routeDetails(let route):
            RouteDetailsView(model: RouteDetailsModel(route: route))
        case .stepsList:
            StepsListView(model: StepsListModel())
        }
    }
}

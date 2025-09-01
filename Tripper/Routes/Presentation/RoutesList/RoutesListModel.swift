//
//  RoutesListModel.swift
//  iosApp
//
//  Created by Alexander on 18.08.2025.
//

import Foundation

@Observable
final class RoutesListModel {
    private(set) var state = RoutesListState(routes: [
        .init(id: 1, name: "Центр города")
    ])

    init() {}
}

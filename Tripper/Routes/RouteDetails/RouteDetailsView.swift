//
//  RouteDetailsView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct RouteDetailsView: View {
    let model: RouteDetailsModel
    @Environment(Router.self) private var router

    var body: some View {
        VStack {
            Spacer()
            
            Button("Начать") {
                router.navigate(to: .stepsList(2))
            }
        }
        .navigationTitle(model.state.title)
    }
}

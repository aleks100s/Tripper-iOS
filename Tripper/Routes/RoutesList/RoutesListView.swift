//
//  RoutesListView.swift
//  iosApp
//
//  Created by Alexander on 18.08.2025.
//

import SwiftUI

struct RoutesListView: View {
    @State private var model: RoutesListModel
    @State private var showContent = false
    @Environment(Router.self) private var router
    
    init(model: RoutesListModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            Button("Click me!") {
                withAnimation {
                    showContent = !showContent
                }
            }

            if showContent {
                VStack(spacing: 16) {
                    Image(systemName: "swift")
                        .font(.system(size: 200))
                        .foregroundColor(.accentColor)
                    Text("SwiftUI")
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            
            ForEach(model.state.routes) { route in
                Text(route.name)
                    .padding()
                    .onTapGesture {
                        router.navigate(to: .routeDetails(route))
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .navigationTitle("Маршруты")
    }
}

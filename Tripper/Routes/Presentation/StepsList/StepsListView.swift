//
//  StepsListView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import SwiftUI

struct StepsListView: View {
    let model: StepsListModel

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .center, spacing: 16) {
                    ForEach(model.state.steps.indices, id: \.self) { index in
                        StepView(step: model.state.steps[index])
                            .id(index)
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
            .sensoryFeedback(.impact, trigger: model.state.steps.count)
            .onChange(of: model.state.steps.count) {
                guard model.state.steps.count > 2 else { return }

                withAnimation(.easeInOut(duration: 1)) {
                    proxy.scrollTo(model.state.steps.count - 1, anchor: .bottom)
                }
            }
        }
        .navigationTitle(model.state.title)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    model.nextStep()
                } label: {
                    Text("Далее")
                }
            }
        }
        .onAppear {
            model.fetchFirstStep()
        }
    }
}

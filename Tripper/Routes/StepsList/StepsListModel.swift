//
//  StepsListModel.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import MapKit
import SwiftUICore

@Observable
final class StepsListModel {
    private(set) var state = StepsListState(title: "Центр города", steps: [])

    private var internalSteps: [Step] = [
        .image(.init(title: "Старый речной вокзал", text: "Памятник советской архитектуры, расположенный на набережной реки Енисей в Красноярске.", image: .riverPort)),
        .transit(.init(start: bridge, finish: riverPort)),
        .image(.init(title: "Полюбуйтесь", text: "Вы могли видеть мост на 10-рублевой купюре", image: .bridge)),
        .text(.init(title: "Коммунальный мост", text: "Вы находитесь у главного символа города - коммунального моста."))
    ]
    
    init() {}

    func fetchFirstStep() {
        nextStep()
    }
    
    func nextStep() {
        if let step = internalSteps.popLast() {
            withAnimation {
                state.steps.append(step)
            }
        }
    }
}

private let bridge = MKMapPoint(CLLocationCoordinate2D(
    latitude: 56.006729,
    longitude: 92.873314
))

private let riverPort = MKMapPoint(CLLocationCoordinate2D(
    latitude: 56.007849,
    longitude: 92.881861
))

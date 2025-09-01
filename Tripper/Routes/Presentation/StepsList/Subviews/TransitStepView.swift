//
//  TransitMapView.swift
//  iosApp
//
//  Created by Alexander on 24.08.2025.
//

import MapKit
import SwiftUI

struct TransitStepView: View {
    let transit: TransitStep
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Куда дальше?")
                .monospaced()
                .padding(16)

            Map(bounds: .meters(100), interactionModes: []) {
                Marker("Вы тут", monogram: Text("A"), coordinate: transit.start.coordinate)
                Marker("Вам сюда", monogram: Text("B"), coordinate: transit.finish.coordinate)
            }
            .frame(height: 200)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Button {
                        openYandex()
                    } label: {
                        HStack {
                            Text("Яндекс Карты")
                            Image(.yandexMapsLogo)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32)
                                .padding(8)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding(8)
            }
        }
    }
    
    private func openYandex() {
        guard let url = URL.yandexMapsRoute(from: transit.start, to: transit.finish),
              UIApplication.shared.canOpenURL(url) else {
            return
        }

        UIApplication.shared.open(url)
    }
}

private extension MapCameraBounds {
    static let ppm = MKMapPointsPerMeterAtLatitude(56.012267)

    static func meters(_ count: Double) -> Self {
        MapCameraBounds(minimumDistance: count * ppm, maximumDistance: count * ppm)
    }
}

private extension URL {
    static func yandexMapsRoute(from: MKMapPoint, to: MKMapPoint) -> URL? {
        URL(string: "https://yandex.ru/maps/?mode=routes&rtext=\(from.coordinate.latitude)%2C\(from.coordinate.longitude)~\(to.coordinate.latitude)%2C\(to.coordinate.longitude)&rtt=auto")
    }
    
    static func yandexMapsPoint(_ point: MKMapPoint) -> URL? {
        URL(string: "https://yandex.ru/maps/?pt=\(point.coordinate.longitude),\(point.coordinate.latitude)&z=18&l=map")
    }
    
    static func doubleGISRoute(from: MKMapPoint, to: MKMapPoint) -> URL? {
        URL(string: "https://2gis.ru/directions/tab/pedestrian/points/|\(to.coordinate.latitude)%2C\(to.coordinate.longitude);")
    }
    
    static func doubleGISPoint(_ point: MKMapPoint) -> URL? {
        URL(string: "https://2gis.ru/geo/\(point.coordinate.longitude),\(point.coordinate.latitude)")
    }
}

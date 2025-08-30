//
//  Router.swift
//  Tripper
//
//  Created by Alexander on 28.08.2025.
//


import Foundation

@Observable
final class Router {
    var path: [Destination] = []
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
}
//
//  Title.swift
//  Tripper
//
//  Created by Alexander on 28.08.2025.
//


import SwiftUI

struct Title: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .fontDesign(.monospaced)
    }
}
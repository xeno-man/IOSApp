//
//  NavView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 09/01/2022.
//
import SwiftUI
//van https://stackoverflow.com/questions/57594159/swiftui-navigationlink-loads-destination-view-immediately-without-clicking  zodat ik calls en memory kan sparen
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}


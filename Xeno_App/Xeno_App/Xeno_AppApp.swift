//
//  Xeno_AppApp.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 28/09/2021.
//

import SwiftUI

@main
struct Xeno_AppApp: App {
    var body: some Scene {
        var champ = Champion(id: 1, name: "Aatrox" , price: 6300)
        WindowGroup {
            ContentView(champ: champ)
        }
    }
}

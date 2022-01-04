//
//  Xeno_AppApp.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 28/09/2021.
//

import SwiftUI

@main
struct Xeno_AppApp: App {
    let model =  GameViewModel()
 
    var body: some Scene {
       
        WindowGroup {
            ContentView(model:model )
        }
    }
}

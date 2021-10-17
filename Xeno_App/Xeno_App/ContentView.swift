//
//  ContentView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    var champs = [Champion]()
    var body: some View {
        
        VStack{
            
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg")).
            } else {
                // Fallback on earlier versions
                
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

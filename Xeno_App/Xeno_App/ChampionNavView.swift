//
//  ChampionNavView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 24/10/2021.
//

import SwiftUI

struct ChampionNavView: View {
    var champs  : Champion
    var body: some View {
        NavigationView{
            VStack{
            NavigationLink(destination: { } ){
                    Text(champs.name)
                
            }
            }
            
        }
    }
}



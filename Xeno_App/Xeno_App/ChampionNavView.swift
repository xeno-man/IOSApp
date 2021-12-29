//
//  ChampionNavView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 24/10/2021.
//

import SwiftUI

struct ChampionNavView: View {
    var champs  : [Champion]
    var body: some View {
        NavigationView{
            VStack{
                ForEach(champs){ champion in
                    
                    NavigationLink(destination: { ChampionDetail(champ: champion)} ){
                            Text(champion.name)
                        
                    }
                }
            
            }
            
        }
    }
}



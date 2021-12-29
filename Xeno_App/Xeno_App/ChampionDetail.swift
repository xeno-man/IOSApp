//
//  ChampionDetail.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 18/10/2021.
//

import SwiftUI

struct ChampionDetail: View {
    var champ : Champion
    
    var body: some View {
        VStack{
            Text(champ.name)
            Spacer()
            Text(champ.price.description)
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champ.name)_0.jpg")).fixedSize().scaledToFit()
            } else {
                // Fallback on earlier versions
                
            }
            
           
        }
    }
                
                
}

struct ChampionDetail_Previews:
    PreviewProvider {
    
    static var previews: some View {
        var champ = Champion(id : 1,name: "Aatrox", price: 100)
        ChampionDetail(champ: champ)
    }
}

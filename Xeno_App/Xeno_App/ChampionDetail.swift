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
        }
    }
}

struct ChampionDetail_Previews:
    PreviewProvider {
    
    static var previews: some View {
        var champ = Champion(name: "test", price: 100)
        ChampionDetail(champ: champ)
    }
}

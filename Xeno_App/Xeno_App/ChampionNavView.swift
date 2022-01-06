//
//  ChampionNavView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 24/10/2021.
//

import SwiftUI

struct ChampionNavView: View {
    @ObservedObject var champlist : ChampionViewModel = ChampionViewModel()
    
    
    
    var body: some View {
       
            NavigationView{
                ScrollView{
                    ZStack{
                        VStack(alignment: .leading, spacing: 5){
                        ForEach(champlist.champs){ champion in
                                NavigationLink(destination: { ChampionDetail(champ: champlist.getChampionDetail(name: champion.name))} ){
                                    NavCell(champ: champion)
                                    
                                    
                                
                            }
                        }
                    
                    }
                    
                }
                }
               
            }
        
    }
    
    
}

struct NavCell : View{
    private(set) var champ : Champion
    
    var body: some View{
        HStack{
            ImageView(url: champ.artworkImageString, width: 70,height: 100).frame(height: 70).cornerRadius(5)
            Text(champ.name).font(.title).minimumScaleFactor(0.5)
        }
    }
    
}


   
    
    





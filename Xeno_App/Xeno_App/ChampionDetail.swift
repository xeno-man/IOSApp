//
//  ChampionDetail.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 18/10/2021.
//

import SwiftUI
import SwiftUITooltip

struct ChampionDetail: View {
    var tooltipConfig = DefaultTooltipConfig()
    var champ : ChampiondetailModel
 
    
    init(champ : ChampiondetailModel){
        self.champ = champ;
        self.tooltipConfig.enableAnimation = true
        
    }
    
    var body: some View {
        
            VStack{
                Text(champ.name)
                Text(champ.title)
                CarouselView(Champ: champ)
                Spacer()
                spellView
               
            }
                .frame(width: .infinity, height: .infinity)
        
        
    }
    
    var ImageView : some View{
        HStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: champ.image),scale: 2){ phase in
                    if let image = phase.image {
                       
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding()
                           
                    } else if phase.error != nil {
                        Text("").onAppear{
                          
                        }
                       
                    } else {
                        
                        VStack{
                            ProgressView().progressViewStyle(.circular)
                            Text("wait a second while we load the picture")
                        }
                        // Acts as a placeholder.
                    }
                    
                    
                }.frame( height:100 )
            } else {
                // Fallback on earlier versions
                // Fallback on earlier versions
                ImageViewPre15(withURL: champ.image)
                   
            }
        }
        
        
    }
    
    var spellView : some View{
        HStack{
            ForEach(champ.spells){ spell in
                
                VStack{
                    Text(spell.name)
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: spell.image),scale: 2){ phase in
                            if let image = phase.image {
                               
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding()
                                    .onTapGesture{
                                        image.tooltip(.bottom){
                                            Text(spell.description)
                                            
                                        }
                                    }
                                   
                                   
                            } else if phase.error != nil {
                                Text("").onAppear{
                                  
                                }
                               
                            } else {
                                
                                VStack{
                                    ProgressView().progressViewStyle(.circular)
                                    Text("wait a second while we load the picture")
                                }
                                // Acts as a placeholder.
                            }
                            
                            
                        }.frame( height:60 )
                    } else {
                        // Fallback on earlier versions
                        // Fallback on earlier versions
                        ImageViewPre15(withURL: spell.image)
                    }
                }
            }
        }
    }
    
                
                
}

struct CarouselView : View{
    @State private var index = 0
    public var Champ : ChampiondetailModel
    var body: some View{
        VStack{
            TabView(selection: $index) {
                ForEach((0..<Champ.amountOfSkins), id: \.self) { index in
                    ImageView(url: Champ.getSkin(counter: index),width: 100,height: 100).frame(width: 150, height: 150)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}




/*struct ChampionDetail_Previews:
    PreviewProvider {
    
    static var previews: some View {
        var champ = Champion(id : 1,name: "Aatrox")
        ChampionDetail(champ: champ)
    }
}*/

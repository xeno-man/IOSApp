//
//  ChampionDetail.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 18/10/2021.
//

import SwiftUI
import SwiftUITooltip

struct ChampionDetail: View {
    var champ : ChampiondetailModel
 
    
    
    
    var body: some View {
        
            VStack{
                Text(champ.name).font(.title)
                Text(champ.title).font(.subheadline)
                CarouselView(Champ: champ)
                spellView.padding(.bottom)
               
            }.padding()
                
        
        
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
                            Rectangle()
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
                    ImageView(url: Champ.getSkin(counter: index),width: 400,height: 400)
                            }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack(spacing: 2) {
                ForEach((0..<Champ.amountOfSkins), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            self.index = index
                        }

                }
            }
            
                        
                        
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

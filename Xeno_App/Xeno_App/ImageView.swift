//
//  ImageView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 06/01/2022.
//

import SwiftUI

struct ImageView :  View{
    private(set) var url : String
    private(set) var width: CGFloat
    private(set) var height: CGFloat
    
    var body: some View{
        HStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: url),scale: 2){ phase in
                    if let image = phase.image {
                       
                        image
                            .resizable()
                            .scaledToFit()
                            .frame( height: height)
                            
                           
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
                    
                    
                }.frame(width: width, height: height )
            } else {
                // Fallback on earlier versions
                // Fallback on earlier versions
                ImageViewPre15(withURL: url)
                   
            }
        }
    }
}

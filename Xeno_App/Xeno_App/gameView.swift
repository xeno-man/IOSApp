//
//  gameView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 27/10/2021.
//

import SwiftUI

struct gameView: View {
    @StateObject  var game : GameViewModel
  
    @State var counter = 0
    @State private var guess : String = ""
    @State public var QuestionNr = 0
    
    
    
   
    
     func nextChamp(){
        counter = counter + 1
         print("counter = \(counter)")
        
    }

    var body: some View {
        if game.model.AllChamps.count == 0{
            ProgressView()
        }else{
            if !game.model.hasEnded{
                GuessView
                
            }else{
                ScoreView
                    
            }
        }
   
    }
    
    var GuessView : some View{
        ZStack{
            Color(hue:0.156,saturation: 0.300,brightness: 0.400)
            VStack{
                
                Text("\(counter)/5").font(.title)
                Spacer()
                ImageView
                Spacer()
                TextField("guess the champion name",text: $guess)
                    .padding()
                    .frame(width: 300, height: 50)
                    .border(.black)
                    HStack{
                        Button("Guess"){
                            game.Guess(guessedName: guess, index: counter)
                            print(game.model.score)
                            nextChamp()
                            QuestionNr += 1
                            guess = ""
                        }
                        //Spacer()
                        Button("Skip"){
                            game.Guess(guessedName: "", index: counter)
                            QuestionNr += 1
                            print(game.model.score)
                            nextChamp()
                            guess = ""
                        }
                    }.padding()
                    
                
                
            }
        }.ignoresSafeArea()
       
    }
    

    var ImageView : some View{
        HStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: game.model.AllChamps[counter].artworkImageString),scale: 2){ phase in
                    if let image = phase.image {
                       
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding()
                            .onAppear{
                               
                            }
                    } else if phase.error != nil {
                        Text("").onAppear{
                           nextChamp()
                        }
                       
                    } else {
                        
                        VStack{
                            ProgressView().progressViewStyle(.circular).onAppear{
                                
                            }
                            Text("wait a second while we load the picture")
                        }
                        // Acts as a placeholder.
                    }
                    
                    
                }.frame( height:300 )
            } else {
                // Fallback on earlier versions
                // Fallback on earlier versions
                ImageViewPre15(withURL: game.model.AllChamps[counter].artworkImageString)
                
            }
        }
        
        
    }
    
var  ScoreView :  some View{
   
        ZStack{
            SetBackGroundColor()
            VStack{
                if game.model.score >= 3 {
                    GoodScoreView
                }else {
                    
                    BadScoreView
                    
                }
                ButtonGroup
            }
           
            
            
        }.ignoresSafeArea()
      
       
        
}
    
    var GoodScoreView : some View{
        VStack{
            Text("\(game.model.score)/5 well done").font(.title)
        }
       
    }
    
    var BadScoreView : some View{
        VStack{
            Text("\(game.model.score)/5,could be better ").font(.title)
            
        }
        
    }
    
    var ButtonGroup : some View{
        HStack{
            Button("play again"){
                async{
                    counter = 0
                    await game.StartGame()
                    
                }
               
               
                
            } .padding()
                
                .foregroundColor(.white)
                .font(.title)
                .background(Color(hue:0.656, saturation:0.787, brightness:0.454))
                .cornerRadius(50)
           
        }.padding()
    }
    
    func SetBackGroundColor()-> Color{
        if game.model.score >= 3 {
            return Color.green
        }else{
            return Color.red
        }
    }
}

struct preview : PreviewProvider{
    static var previews: some View {
        
        
        return gameView(game:.init())
        
    }
}








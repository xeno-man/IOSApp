//
//  models.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 04/01/2022.
//

import Foundation

struct Champion : Decodable , Identifiable{
    let Id = UUID()
    var id : Int
    var name : String
    
    
    var artworkImageString: String {
            return "https://ddragon.leagueoflegends.com/cdn/12.1.1/img/champion/\(name).png"
        }
        
        var splashImageString: String {
            return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(name)_0.jpg"
        }
    
    
   
    
    
    
    
}

struct ChampiondetailModel : Identifiable{
    
    
    private(set) var id: Int
    private(set) var name: String
    private(set) var title: String
    private(set) var spells : [Spell]
    private(set) var image : String
    private(set) var amountOfSkins : Int
    public var skinCounter : Int = 0
    
    init(id : Int,name : String, title : String, spells: [Spell],image : String,nrOfSkins:Int){
        self.id = id;
        self.name = name;
        self.title = title;
        self.spells = spells;
        self.image = image
        self.amountOfSkins = nrOfSkins
    }
    
    public mutating func nextSkin(){
        if skinCounter < amountOfSkins{
            skinCounter += 1
        }else{
            skinCounter = 0
        }
    }
    
    public mutating func prevSkin(){
        if skinCounter == 0 {
            skinCounter = amountOfSkins
        }else{
            skinCounter -= 1
        }
    }
    
    public func getSkin(counter : Int)-> String{
        if counter > amountOfSkins || counter < 0{
            return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(name)_0.jpg"
        }
        return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(name)_\(counter).jpg"
    }
    
}

struct Spell : Identifiable {
    public var id : Int
    public var name : String
    public var image : String
    public var description : String
}



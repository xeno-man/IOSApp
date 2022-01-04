//
//  Place.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/18/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public enum Place: String, CustomStringConvertible {
    case SummonersRift = "Summoner's Rift"
    case ProvingGrounds = "The Proving Grounds"
    case TwistedTreeline = "Twisted Treeline"
    case CrystalScar = "The Crystal Scar"
    case HowlingAbyss = "Howling Abyss"
    case ButchersBridge = "Butcher's Bridge"
    case CosmicRuins = "Cosmic Ruins"
    case ValoranCityPark = "Valoran City Park"
    case Substructure43 = "Substructure 43"
    case NexusBlitz = "Nexus Blitz"
    case CrashSite = "Crash Site"
    case Convergence = "Convergence"
    case Unknown = "Unknown"
    
    public var description: String {
        return self.rawValue
    }
}

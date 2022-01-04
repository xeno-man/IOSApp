//
//  ServiceProxy.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/26/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class ServiceProxy {
    
    public private(set) var region: Region
    public private(set) var platforms: [Platform]
    private var host: Endpoint

    // Only some services use SEA World Region
    // OCE region was previously in Ameria but will probably fall to SEA in the future
    // This variable is here so that new services can use SEA region with OCE
    // Old services will still locate OCE in Ameria
    public var allowSouthEastAsiaWorldRegion: Bool = false
    
    public var hostUrl: String {
        return self.host.rawValue
    }
    
    public var worldRegion: WorldRegion {
        switch self.region {
        case .NA, .BR, .LAN, .LAS, .PBE: // PBE is not officialy on America region
            return .America
        case .KR, .JP:
            return .Asia
        case .EUNE, .EUW, .TR, .RU:
            return .Europe
        case .OCE:
            if self.allowSouthEastAsiaWorldRegion {
                return .SouthEastAsia
            } else {
                return .America
            }
        }
    }
    
    public var worldRegionEndpoint: Endpoint {
        switch self.worldRegion {
        case .America:
            return .America
        case .Asia:
            return .Asia
        case .Europe:
            return .Europe
        case .SouthEastAsia:
            return .SouthEastAsia
        case .Esports:
            return .Esports
        }
    }
    
    public var worldRegionHostUrl: String {
        return self.worldRegionEndpoint.rawValue
    }
    
    private init(region: Region, platforms: [Platform], host: Endpoint) {
        self.region = region
        self.platforms = platforms
        self.host = host
    }
    
    public convenience init(for region: Region) {
        switch region {
        case .BR:
            self.init(region: region, platforms: [.BR1], host: .BR)
        case .EUNE:
            self.init(region: region, platforms: [.EUN1], host: .EUNE)
        case .EUW:
            self.init(region: region, platforms: [.EUW1], host: .EUW)
        case .JP:
            self.init(region: region, platforms: [.JP1], host: .JP)
        case .KR:
            self.init(region: region, platforms: [.KR], host: .KR)
        case .LAN:
            self.init(region: region, platforms: [.LA1], host: .LAN)
        case .LAS:
            self.init(region: region, platforms: [.LA2], host: .LAS)
        case .NA:
            self.init(region: region, platforms: [.NA1, .NA], host: .NA)
        case .OCE:
            self.init(region: region, platforms: [.OC1], host: .OCE)
        case .PBE:
            self.init(region: region, platforms: [.PBE1], host: .PBE)
        case .RU:
            self.init(region: region, platforms: [.RU], host: .RU)
        case .TR:
            self.init(region: region, platforms: [.TR1], host: .TR)
        }
    }
    
    public convenience init(for worldRegion: WorldRegion) {
        switch worldRegion {
        case .America:
            self.init(for: .NA)
        case .Asia:
            self.init(for: .KR)
        case .Europe:
            self.init(for: .EUW)
        case .SouthEastAsia:
            self.init(for: .OCE)
        case .Esports:
            self.init(for: .KR) // there is no real mapping from WorldRegion.Esports to Region
        }
    }
}

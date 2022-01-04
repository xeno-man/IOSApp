//
//  RankedMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/28/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class RankedMethod: LeagueMethod {
    
    public enum RankedMethods: CustomStringConvertible {
        case ChallengerByQueue(queue: Queue)
        case GrandMasterByQueue(queue: Queue)
        case MasterByQueue(queue: Queue)
        case LeagueById(id: LeagueId)
        case EntriesById(id: SummonerId)
        case QueueEntries(queue: Queue, division: RankedDivision, page: Int)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .ChallengerByQueue:
                    return "ChallengerByQueue"
                case .GrandMasterByQueue:
                    return "GrandMasterByQueue"
                case .MasterByQueue:
                    return "MasterByQueue"
                case .LeagueById:
                    return "LeagueById"
                case .EntriesById:
                    return "EntriesById"
                case .QueueEntries:
                    return "QueueEntries"
                }
            }
            return "\(String(describing: RankedMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: RankedMethods
    
    public init(method: RankedMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    func getMethodSignature() -> String {
        return self.method.description
    }
    
    func getMethodUrl() -> String {
        let entrypoint: String = self.service.hostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.League.rawValue)/\(Version.LOL_API)"
        switch self.method {
        case .ChallengerByQueue(let queue):
            return "\(commonPath)/challengerleagues/by-queue/\(queue.type.rawValue)"
        case .GrandMasterByQueue(let queue):
            return "\(commonPath)/grandmasterleagues/by-queue/\(queue.type.rawValue)"
        case .LeagueById(let id):
            return "\(commonPath)/leagues/\(id)"
        case .MasterByQueue(let queue):
            return "\(commonPath)/masterleagues/by-queue/\(queue.type.rawValue)"
        case .EntriesById(let id):
            return "\(commonPath)/entries/by-summoner/\(id)"
        case .QueueEntries(let queue, let division, let page):
            return "\(commonPath)/entries/\(queue.type.rawValue)/\(division.tier.tier.rawValue)/\(division.divisionRoman)?page=\(page)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getCustomHeaders() -> [String: String] {
        return [:]
    }
    
    func getWarningMessage() -> String? {
        switch self.method {
        case .ChallengerByQueue, .GrandMasterByQueue, .MasterByQueue, .EntriesById, .QueueEntries:
            return nil
        case .LeagueById:
            return "Too many calls to unexisting League(by LeagueId) may result in Blacklist"
        }
    }
}

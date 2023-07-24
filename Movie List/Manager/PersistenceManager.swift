//
//  PersistenceManager.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import Foundation

class PersistenceManager
{
    private let defaults = UserDefaults.standard
    private let watchListKey = "watchListKey"
    
    var watchList = [String]()
    
    init() {
        watchList = defaults.object(forKey: watchListKey) as? [String] ?? [String]()
    }
    
    func addToWatchList(movieId: String) {
        
        if !watchList.contains(movieId) {
            watchList.append(movieId)
            defaults.set(watchList, forKey: watchListKey)
            defaults.synchronize()
        }
    }
    
    func removeFromWatchList(movieId: String) {
        
        if watchList.contains(movieId) {
            watchList.removeAll(where: { $0 == movieId })
            defaults.set(watchList, forKey: watchListKey)
            defaults.synchronize()
        }
    }
  
}

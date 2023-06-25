//
//  FetchState.swift
//  MyMusicApp
//
//  Created by Edward on 17.06.2023.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}


//
//  Errors.swift
//  MyMusicApp
//
//  Created by Edward on 20.06.2023.
//

import Foundation

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}


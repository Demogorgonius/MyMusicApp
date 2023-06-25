//
//  UserModel.swift
//  MyMusicApp
//
//  Created by Edward on 24.06.2023.
//

import UIKit
import RealmSwift

class UserModel: Object {
    @objc dynamic var idUuid: String = ""
    @objc dynamic var name: String?
    @objc dynamic var email: String = ""
    @objc dynamic var dateBirth: Date?
    @objc dynamic var gender: String?
    @objc dynamic var avatarImage: Data?

    
    let favoriteAlbums = List<RealmAlbumModel>()

    
    let downloadedAlbums = List<RealmAlbumModel>()

    override static func primaryKey() -> String? {
        return "idUuid"
    }
}

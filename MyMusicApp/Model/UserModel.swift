//
//  UserModel.swift
//  MyMusicApp
//
//  Created by Edward on 20.06.2023.
//

import UIKit
import RealmSwift

class UserModel: Object {
    @objc dynamic var idUuid: String = ""
    @objc dynamic var name: String?
    @objc dynamic var email: String = ""
    @objc dynamic var dateBirth: Date?
    @objc dynamic var gender: String?
    @objc dynamic var avatarImage: Data? // Store the avatar image as Data

    override static func primaryKey() -> String? {
        return "idUuid" // Set the primary key property
    }
}


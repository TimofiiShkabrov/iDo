//
//  UserModel.swift
//  iDo
//
//  Created by Тимофей Шкабров on 26.07.2023.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joinDate: TimeInterval
}

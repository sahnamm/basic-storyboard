//
//  PlayerModel.swift
//  Basic-Storyboard
//
//  Created by Sahna Melly Marselina on 23/02/23.
//

import UIKit

struct Player: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var team: Team
    var age: Int
    var height: String
    var weight: Int
}

struct Team {
    var color: UIColor
    var imageName: String
}

let goldenState = Team(color: UIColor(red: 0.965, green: 0.761, blue: 0.275, alpha: 1), imageName: "gs")
let toronto = Team(color: UIColor(red: 0.718, green: 0.165, blue: 0.263, alpha: 1), imageName: "tr")

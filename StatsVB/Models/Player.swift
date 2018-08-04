//
//  Player.swift
//  StatsVB
//
//  Created by Liam Bakar on 7/27/18.
//  Copyright © 2018 Liam Bakar. All rights reserved.
//

import Foundation

class Player{
    var name = ""
    var position = Position()
    var kills = 0
    var attempts = 0
    var kerrors = 0
    var playerNumber: Int
    var isOn: Bool = false
    var aces = 0
    var ferrors = 0
    var serves = 0
    var attackingPercentage = 0.0
    var servingPercentage = 0.0
    
    init(name: String, playerNumber: Int){
        self.name = name
        self.playerNumber = playerNumber
    }
}

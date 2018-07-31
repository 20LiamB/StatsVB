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
    var errors = 0
    var playerNumber: Int
    var isOn: Bool = false
    
    init(name: String, playerNumber: Int){
        self.name = name
        self.playerNumber = playerNumber
    }
}

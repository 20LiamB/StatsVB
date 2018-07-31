//
//  MainScreenViewController.swift
//  StatsVB
//
//  Created by Liam Bakar on 7/23/18.
//  Copyright © 2018 Liam Bakar. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: UIViewController {
    
    //scoreboard
    var leftScore: Int = 0
    var rightScore: Int = 0
    var game: Game?
    var selectedPlayer: Player?
    
    @IBOutlet weak var scoreTextField: UITextView!
    @IBOutlet weak var leftAddToScore: UIButton!
    @IBOutlet weak var leftSubractFromScore: UIButton!
    @IBOutlet weak var rightAddToScore: UIButton!
    @IBOutlet weak var rightSubtractFromScore: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var leftPlayer1: UIButton!
    @IBOutlet weak var leftPlayer2: UIButton!
    @IBOutlet weak var leftPlayer3: UIButton!
    @IBOutlet weak var leftPlayer4: UIButton!
    @IBOutlet weak var leftPlayer5: UIButton!
    @IBOutlet weak var leftPlayer6: UIButton!
    var leftPlayerList: [Player?] = [nil, nil, nil, nil, nil, nil]
    @IBOutlet weak var hiddenMenuView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var newPlayerButton: UIButton!
    @IBOutlet weak var newPlayerMenu: UIView!
    @IBOutlet weak var newPlayerName: UITextField!
    
    var players: [Player] = [Player(name: "Player", playerNumber: 0), Player(name: "Player", playerNumber: 1), Player(name: "Player", playerNumber: 2), Player(name: "Player", playerNumber: 3), Player(name: "Player", playerNumber: 4), Player(name: "Player", playerNumber: 5) ]
    
    @IBAction func leftAdd(_ sender: Any) {
        leftScore += 1
        updateScore()
    }
    @IBAction func leftSubtract(_ sender: Any) {
        if leftScore > 0 {
            leftScore -= 1
        }
        updateScore()
    }
    @IBAction func rightAdd(_ sender: Any) {
        rightScore += 1
        updateScore()
    }
    @IBAction func rightSubtract(_ sender: Any) {
        if rightScore > 0 {
            rightScore -= 1
            
        }
        updateScore()
    }
    
    func player1ButtonTapped() {
        
        selectedPlayer = players[0]
        
        for x in players {
            x.isOn = false
        }
        players[0].isOn = true
    }
    
    func updateScore(){
        scoreTextField.text = "\(leftScore) - \(rightScore)"
    }
    
    //player button functions
    func newPlayer(index: Int, buttonTitle: String){
        //leftPlayerList[index] = Player(name: "", playerNumber: <#T##Int#>)
        
    }
    
    func openStatScreen(){
        
    }
    
    @objc func normalTap(_ sender: UIGestureRecognizer){
        
        print("Normal tap")
        var buttonTag = 0
        
        if leftPlayerList[buttonTag] != nil {
            openStatScreen()
        } else {
            newPlayer(index: buttonTag, buttonTitle: "placehold")
        }
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            print("Ended")
        }
        else if sender.state == .began {
            print("Began")
            hiddenMenuView.isHidden = false
        }
    }
    @IBAction func newPlayerPressed(_ sender: Any) {
        menuView.isHidden = true
        newPlayerMenu.isHidden = false
    }
    
    
    
    @IBAction func savePlayer(_ sender: Any) {
        
        switch selectedPlayer?.playerNumber {
        case 0 :
            leftPlayer1.setTitle(newPlayerName.text, for: .normal)
        case 1 :
            leftPlayer2.setTitle(newPlayerName.text, for: .normal)
        case 2 :
            leftPlayer3.setTitle(newPlayerName.text, for: .normal)
        case 3 :
            leftPlayer4.setTitle(newPlayerName.text, for: .normal)
        case 4 :
            leftPlayer5.setTitle(newPlayerName.text, for: .normal)
        case 5 :
            leftPlayer6.setTitle(newPlayerName.text, for: .normal)
        default :
            print("No player selected.")
        }
        leftPlayer1.setTitle(newPlayerName.text, for: .normal)
        
        newPlayerMenu.isHidden = true
        hiddenMenuView.isHidden = true
        menuView.isHidden = false
    }
    
    @IBAction func cancelPlayer(_ sender: Any) {
        newPlayerMenu.isHidden = true
        hiddenMenuView.isHidden = true
        menuView.isHidden = false
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        
        leftPlayer1.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        leftPlayer1.addGestureRecognizer(longGesture)
        
        var savedLeftScore = game?.leftScore
        
        if let game = game {
            leftScore = Int(game.leftScore)
            rightScore = Int(game.rightScore)
        }
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let game = game {
            titleTextField.text = game.title
            scoreTextField.text = game.score
        }else{
            titleTextField.text = ""
            scoreTextField.text = "" //I changed this
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "save" where game != nil:
            game?.title = titleTextField.text ?? ""
            game?.score = scoreTextField.text ?? ""
            game?.leftScore = Int32(leftScore)
            game?.rightScore = Int32(rightScore)
            game?.date = Date()
            
            CoreDataHelper.saveGame()
            
        case "save" where game == nil:
            let game = CoreDataHelper.newGame()
            game.title = titleTextField.text ?? ""
            game.score = scoreTextField.text ?? ""
            game.leftScore = Int32(Int16(leftScore))
            game.rightScore = Int32(Int16(rightScore))
            game.date = Date()
            
            CoreDataHelper.saveGame()
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    
    //player buttons
    
}

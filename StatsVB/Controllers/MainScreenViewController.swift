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
    var kills: Int = 0
    var kerrors: Int = 0
    var attempts: Int = 0
    var aces: Int = 0
    var serrrors: Int = 0
    var serves: Int = 0
    
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
    @IBOutlet weak var hiddenMenuView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var newPlayerButton: UIButton!
    @IBOutlet weak var newPlayerMenu: UIView!
    @IBOutlet weak var newPlayerName: UITextField!
    
    @IBOutlet weak var attemptsStepper: UIStepper!
    @IBOutlet weak var kerrorsStepper: UIStepper!
    @IBOutlet weak var killsStepper: UIStepper!
    @IBOutlet weak var acesStepper: UIStepper!
    @IBOutlet weak var errorsStepper: UIStepper!
    @IBOutlet weak var servesStepper: UIStepper!
    @IBOutlet weak var attemptsField: UITextField!
    @IBOutlet weak var ferrorsField: UITextField!
    @IBOutlet weak var killsField: UITextField!
    @IBOutlet weak var attackingPercentageField: UITextField!
    
    var players: [Player] = [Player(name: "Player", playerNumber: 0), Player(name: "Player", playerNumber: 1), Player(name: "Player", playerNumber: 2), Player(name: "Player", playerNumber: 3), Player(name: "Player", playerNumber: 4), Player(name: "Player", playerNumber: 5) ]
    
    @IBAction func attemptsStepperChanged(_ sender: Any) {
        attempts = Int(attemptsStepper.value)
        attemptsField.text = "\(attempts)"
        selectedPlayer?.attempts = attempts
    }
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
    
    func generateArrayOfButtons() -> [UIButton]{
        let playerButtons: [UIButton] = [leftPlayer1, leftPlayer2, leftPlayer3, leftPlayer4, leftPlayer5, leftPlayer6]
        return playerButtons
    }
    
    @IBAction func leftPlayer1Tapped(_ sender: Any) {
        player1ButtonTapped()
    }
    func player1ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[0]
        
        for x in players {
            x.isOn = false
        }
        players[0].isOn = true
        leftPlayer1.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func leftPlayer2Tapped(_ sender: Any) {
        player2ButtonTapped()
    }
    func player2ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[1]
        
        for x in players {
            x.isOn = false
        }
        players[1].isOn = true
        
        leftPlayer2.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func leftPlayer3Tapped(_ sender: Any) {
        player3ButtonTapped()
    }
    func player3ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[2]
        
        for x in players {
            x.isOn = false
        }
        players[2].isOn = true
        leftPlayer3.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func leftPlayer4Tapped(_ sender: Any) {
        player4ButtonTapped()
    }
    func player4ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[3]
        
        for x in players {
            x.isOn = false
        }
        players[3].isOn = true
        leftPlayer4.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func leftPlayer5Tapped(_ sender: Any) {
        player5ButtonTapped()
    }
    func player5ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[4]
        
        for x in players {
            x.isOn = false
        }
        players[4].isOn = true
        leftPlayer5.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func leftPlayer6Tapped(_ sender: Any) {
        player6ButtonTapped()
    }
    func player6ButtonTapped() {
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[5]
        
        for x in players {
            x.isOn = false
        }
        players[5].isOn = true
        leftPlayer6.backgroundColor = UIColor.darkGray
    }
    
    func updateScore(){
        scoreTextField.text = "\(leftScore) - \(rightScore)"
    }
    
    //player button functions
    func newPlayer(index: Int, buttonTitle: String){
        
    }
    
    func openStatScreen(){
        
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
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
//        tapGesture.numberOfTapsRequired = 1
        
//        leftPlayer1.addGestureRecognizer(tapGesture)
        
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

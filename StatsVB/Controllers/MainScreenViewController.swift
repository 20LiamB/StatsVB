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
    
    var game: Game?
    var selectedPlayer: Player?
    var kills: Int = 0
    var kerrors: Int = 0
    var attempts: Int = 0
    var aces: Int = 0
    var ferrors: Int = 0
    var serves: Int = 0
    var isPlayerSelected: Bool = false
    
    @IBOutlet weak var scoreFieldSet1: UITextField!
    @IBOutlet weak var scoreFieldSet2: UITextField!
    @IBOutlet weak var scoreFieldSet3: UITextField!
    @IBOutlet weak var scoreFieldSet4: UITextField!
    @IBOutlet weak var scoreFieldSet5: UITextField!
    
    
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
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var kerrorsStepper: UIStepper!
    @IBOutlet weak var killsStepper: UIStepper!
    @IBOutlet weak var acesStepper: UIStepper!
    @IBOutlet weak var ferrorsStepper: UIStepper!
    @IBOutlet weak var attemptsField: UITextField!
    @IBOutlet weak var kerrorsField: UITextField!
    @IBOutlet weak var ferrorsField: UITextField!
    @IBOutlet weak var killsField: UITextField!
    @IBOutlet weak var attackingPercentageField: UITextField!
    @IBOutlet weak var acesField: UITextField!
    @IBOutlet weak var servesField: UITextField!
    @IBOutlet weak var servingPercentageField: UITextField!
    
    var players: [Player] = [Player(name: "Player", playerNumber: 0), Player(name: "Player", playerNumber: 1), Player(name: "Player", playerNumber: 2), Player(name: "Player", playerNumber: 3), Player(name: "Player", playerNumber: 4), Player(name: "Player", playerNumber: 5) ]
    
    func calculateAttackingPercentage(k: Int, e: Int, a: Int) -> Double{
        if a > 0 {
            let percentage = Double(1000*(k-e)/a)
            return percentage
        } else {
            return 0
        }
    }
    
    @IBAction func kerrorsStepperChanged(_ sender: Any) {
        
        if isPlayerSelected == true{
            selectedPlayer?.kerrors = Int(kerrorsStepper.value)
            selectedPlayer?.attempts = Int(killsStepper.value + kerrorsStepper.value)
            selectedPlayer?.attackingPercentage = calculateAttackingPercentage(k: (selectedPlayer?.kills)!, e: (selectedPlayer?.kerrors)!, a: (selectedPlayer?.attempts)!)
            attackingPercentageField.text = "\(selectedPlayer?.attackingPercentage  ?? 0)"
        } else {
            kerrorsStepper.value = 0
        }
        kerrorsField.text = Int(kerrorsStepper.value).description
        attemptsField.text = Int(kerrorsStepper.value + killsStepper.value).description
    }
    
    @IBAction func killsStepperChanged(_ sender: Any) {

        if isPlayerSelected == true {
            selectedPlayer?.kills = Int(killsStepper.value)
            selectedPlayer?.attempts = Int(killsStepper.value + kerrorsStepper.value)
            selectedPlayer?.attackingPercentage = calculateAttackingPercentage(k: (selectedPlayer?.kills)!, e: (selectedPlayer?.kerrors)!, a: (selectedPlayer?.attempts)!)
            attackingPercentageField.text = "\(selectedPlayer?.attackingPercentage  ?? 0)"
        } else {
            killsStepper.value = 0
        }
        attemptsField.text = Int(kerrorsStepper.value + killsStepper.value).description
        killsField.text = Int(killsStepper.value).description
    }
    
    @IBAction func acesStepperChanged(_ sender: Any) {
        if isPlayerSelected == true {
            selectedPlayer?.aces = Int(acesStepper.value)
            selectedPlayer?.serves = Int(acesStepper.value + ferrorsStepper.value)
            selectedPlayer?.servingPercentage = calculateAttackingPercentage(k: (selectedPlayer?.aces)!, e: (selectedPlayer?.ferrors)!, a: (selectedPlayer?.serves)!)
            servingPercentageField.text = "\(selectedPlayer?.servingPercentage  ?? 0)"
        } else {
            acesStepper.value = 0
        }
        servesField.text = Int(ferrorsStepper.value + acesStepper.value).description
        acesField.text = Int(acesStepper.value).description
    }
    
    @IBAction func ferrorsStepperChanged(_ sender: Any) {
        if isPlayerSelected == true {
            selectedPlayer?.ferrors = Int(ferrorsStepper.value)
            selectedPlayer?.serves = Int(acesStepper.value + ferrorsStepper.value)
            selectedPlayer?.servingPercentage = calculateAttackingPercentage(k: (selectedPlayer?.aces)!, e: (selectedPlayer?.ferrors)!, a: (selectedPlayer?.serves)!)
            servingPercentageField.text = "\(selectedPlayer?.servingPercentage  ?? 0)"
        } else {
            ferrorsStepper.value = 0
        }
        servesField.text = Int(ferrorsStepper.value + acesStepper.value).description
        ferrorsField.text = Int(ferrorsStepper.value).description
    }
    
    func generateArrayOfButtons() -> [UIButton]{
        let playerButtons: [UIButton] = [leftPlayer1, leftPlayer2, leftPlayer3, leftPlayer4, leftPlayer5, leftPlayer6]
        return playerButtons
    }
    
    @IBAction func leftPlayer1Tapped(_ sender: Any) {
        player1ButtonTapped()
    }
    func player1ButtonTapped() {
        kerrorsStepper.value = Double(players[0].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[0].kills)
        killsField.text = Int(killsStepper.value).description
        let playerButtons = generateArrayOfButtons()
        for b in playerButtons {
            b.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3215686275, blue: 0.1764705882, alpha: 1)
        }
        selectedPlayer = players[0]
        print(selectedPlayer?.kills)
        
        for x in players {
            x.isOn = false
        }
        players[0].isOn = true
        leftPlayer1.backgroundColor = UIColor.darkGray
        
        isPlayerSelected = true
    }
    
    @IBAction func leftPlayer2Tapped(_ sender: Any) {
        player2ButtonTapped()
    }
    func player2ButtonTapped() {
        kerrorsStepper.value = Double(players[1].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[1].kills)
        killsField.text = Int(killsStepper.value).description
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
        
        isPlayerSelected = true
    }
    
    @IBAction func leftPlayer3Tapped(_ sender: Any) {
        player3ButtonTapped()
    }
    func player3ButtonTapped() {
        kerrorsStepper.value = Double(players[2].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[2].kills)
        killsField.text = Int(killsStepper.value).description
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
        
        isPlayerSelected = true
    }
    
    @IBAction func leftPlayer4Tapped(_ sender: Any) {
        player4ButtonTapped()
    }
    func player4ButtonTapped() {
        kerrorsStepper.value = Double(players[3].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[3].kills)
        killsField.text = Int(killsStepper.value).description
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
        
        isPlayerSelected = true
    }
    
    @IBAction func leftPlayer5Tapped(_ sender: Any) {
        player5ButtonTapped()
    }
    func player5ButtonTapped() {
        kerrorsStepper.value = Double(players[4].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[4].kills)
        killsField.text = Int(killsStepper.value).description
        
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
        
        isPlayerSelected = true
    }
    
    @IBAction func leftPlayer6Tapped(_ sender: Any) {
        player6ButtonTapped()
    }
    func player6ButtonTapped() {
        kerrorsStepper.value = Double(players[5].kerrors)
        kerrorsField.text = Int(kerrorsStepper.value).description
        killsStepper.value = Double(players[5].kills)
        killsField.text = Int(killsStepper.value).description
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
        
        isPlayerSelected = true
        
    }
    
    //player button functions
    
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
    
    @IBAction func cancelPressed(_ sender: Any) {
        menuView.isHidden = false
        hiddenMenuView.isHidden = true
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
        
        
        self.view.bringSubview(toFront: self.hiddenMenuView)
        var pNumber = 0
        for p in players {
            p.playerNumber = pNumber
            pNumber += 1
        }
        
        let longGesture1 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        let longGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        let longGesture4 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        let longGesture5 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        let longGesture6 = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        leftPlayer1.addGestureRecognizer(longGesture1)
        leftPlayer2.addGestureRecognizer(longGesture2)
        leftPlayer3.addGestureRecognizer(longGesture3)
        leftPlayer4.addGestureRecognizer(longGesture4)
        leftPlayer5.addGestureRecognizer(longGesture5)
        leftPlayer6.addGestureRecognizer(longGesture6)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isPlayerSelected = false
        
        if let game = game {
            titleTextField.text = game.title
            scoreFieldSet1.text = game.score1
            scoreFieldSet2.text = game.score2
            scoreFieldSet3.text = game.score3
            scoreFieldSet4.text = game.score4
            scoreFieldSet5.text = game.score5

            if game.leftPlayer1Name == "" {
                leftPlayer1.setTitle(game.leftPlayer1Name, for: .normal)
            }
            
            leftPlayer2.setTitle(game.leftPlayer2Name, for: .normal)
            leftPlayer3.setTitle(game.leftPlayer3Name, for: .normal)
            leftPlayer4.setTitle(game.leftPlayer4Name, for: .normal)
            leftPlayer5.setTitle(game.leftPlayer5Name, for: .normal)
            leftPlayer6.setTitle(game.leftPlayer6Name, for: .normal)
            
        }else{
            titleTextField.text = ""
            
            scoreFieldSet1.text = "0 - 0"
            scoreFieldSet2.text = "0 - 0"
            scoreFieldSet3.text = "0 - 0"
            scoreFieldSet4.text = "0 - 0"
            scoreFieldSet5.text = "0 - 0"
            
            leftPlayer1.setTitle("Player", for: .normal)
            leftPlayer2.setTitle("Player", for: .normal)
            leftPlayer3.setTitle("Player", for: .normal)
            leftPlayer4.setTitle("Player", for: .normal)
            leftPlayer5.setTitle("Player", for: .normal)
            leftPlayer6.setTitle("Player", for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "save" where game != nil:
            game?.title = titleTextField.text ?? ""
            
            game?.leftPlayer1Name = leftPlayer1.titleLabel?.text ?? ""
            game?.leftPlayer2Name = leftPlayer2.titleLabel?.text ?? ""
            game?.leftPlayer3Name = leftPlayer3.titleLabel?.text ?? ""
            game?.leftPlayer4Name = leftPlayer4.titleLabel?.text ?? ""
            game?.leftPlayer5Name = leftPlayer5.titleLabel?.text ?? ""
            game?.leftPlayer6Name = leftPlayer6.titleLabel?.text ?? ""
            
            game?.score1 = scoreFieldSet1.text ?? ""
            game?.score2 = scoreFieldSet2.text ?? ""
            game?.score3 = scoreFieldSet3.text ?? ""
            game?.score4 = scoreFieldSet4.text ?? ""
            game?.score5 = scoreFieldSet5.text ?? ""
            game?.date = Date()
            
            CoreDataHelper.saveGame()
            
        case "save" where game == nil:
            let game = CoreDataHelper.newGame()
            game.title = titleTextField.text ?? ""
            
            game.leftPlayer1Name = leftPlayer1.titleLabel?.text ?? ""
            game.leftPlayer2Name = leftPlayer2.titleLabel?.text ?? ""
            game.leftPlayer3Name = leftPlayer3.titleLabel?.text ?? ""
            game.leftPlayer4Name = leftPlayer4.titleLabel?.text ?? ""
            game.leftPlayer5Name = leftPlayer5.titleLabel?.text ?? ""
            game.leftPlayer6Name = leftPlayer6.titleLabel?.text ?? ""
            
            game.score1 = scoreFieldSet1.text ?? ""
            game.score2 = scoreFieldSet2.text ?? ""
            game.score3 = scoreFieldSet3.text ?? ""
            game.score4 = scoreFieldSet4.text ?? ""
            game.score5 = scoreFieldSet5.text ?? ""
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

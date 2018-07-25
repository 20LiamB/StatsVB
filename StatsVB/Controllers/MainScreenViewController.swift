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
    @IBOutlet weak var scoreTextField: UITextView!
    @IBOutlet weak var leftAddToScore: UIButton!
    @IBOutlet weak var leftSubractFromScore: UIButton!
    @IBOutlet weak var rightAddToScore: UIButton!
    @IBOutlet weak var rightSubtractFromScore: UIButton!
    @IBOutlet weak var popUpBlur: UIVisualEffectView!
    @IBOutlet weak var titleTextField: UITextField!
    
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
    
    func updateScore(){
        scoreTextField.text = "\(leftScore) - \(rightScore)"
    }
    

    
    
    //player button functions
    
    @IBAction func showPopUp(_ sender: Any) {
        popUpBlur.isHidden = false
    }
    var leftPlayers: [Player] = []
    var rightPlayers: [Player] = []
    func leftPlayerButtonPressed(index: Int){
        if leftPlayers[index] == nil{
            newPlayer()
        } 
        else{
            openPlayerScreen()
        }
    }
    
    func newPlayer(){
        
    }
    func openPlayerScreen(){
//        switch indentifier {
//        case "OH":
//            openOHView()
//        case "RH":
//            openRHView()
//        case "S":
//            openSView()
//        case "L":
//            openLView()
//        case "MB":
//            openMBView()
//        }
    }
    func openOHView(){
        
    }
    func openRHView(){
        
    }
    func openSView(){
        
    }
    func openLView(){
        
    }
    func openMBView(){
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            game?.date = Date()
            
            CoreDataHelper.saveGame()
            
        case "save" where game == nil:
            let game = CoreDataHelper.newGame()
            game.title = titleTextField.text ?? ""
            game.score = scoreTextField.text ?? ""
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

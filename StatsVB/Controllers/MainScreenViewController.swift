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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var leftPlayer1: UIButton!
    var leftPlayerList: [Player?] = [nil, nil, nil, nil, nil, nil]
    var rightPlayerList: [Player?] = [nil, nil, nil, nil, nil, nil]
    @IBOutlet weak var hiddenMenuView: UIView!
    
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
    
//    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
//
//    let newPlayerAction = UIAlertAction(title: "New Player", style: .default) { (action:UIAlertAction) in
//        print("You've pressed New Player");
//    }
//    let editPlayerAction = UIAlertAction(title: "Edit Player", style: .default) { (action:UIAlertAction) in
//        print("You've pressed Edit Player");
//    }
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
//        print("You've pressed cancel");
//    }
//    func createAlert(){
//        self.present(alert, animated: true, completion: nil)
//
//        alert.addAction(newPlayerAction)
//        alert.addAction(editPlayerAction)
//        alert.addAction(cancelAction)
//    }
    
    
   
    

    
    
    //player button functions
    
    func newPlayer(){
        
    }
    
    @objc func normalTap(_ sender: UIGestureRecognizer){
        
        print("Normal tap")
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
//            createAlert()
            hiddenMenuView.isHidden = false
        }
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

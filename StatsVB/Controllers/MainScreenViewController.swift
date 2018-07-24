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
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let game = game {
            titleTextField.text = game.title
        }
        else{
            titleTextField.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ListGamesTableViewController
            else { return }
        
        switch identifier {
        case "save" where game != nil:
            game?.title = titleTextField.text ?? ""
            
            destination.tableView.reloadData()
        case "save" where game == nil:
            let game = Game()
            game.title = titleTextField.text ?? ""
            game.date = Date()
            
            destination.games.append(game)
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}

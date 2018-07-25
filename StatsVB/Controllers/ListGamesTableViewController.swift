//
//  ListGamesTableViewController.swift
//  StatsVB
//
//  Created by Liam Bakar on 7/23/18.
//  Copyright © 2018 Liam Bakar. All rights reserved.
//

import Foundation
import UIKit

class ListGamesTableViewController: UITableViewController {
    
    var games = [Game](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        games = CoreDataHelper.retrieveGames()
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        games = CoreDataHelper.retrieveGames()
    }
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(games.count)
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listGamesTableViewCell", for: indexPath) as! ListGamesTableViewCell
        
        let game = games[indexPath.row]
        cell.gameTitleLabel.text = game.title
        cell.gameDate.text = game.date?.convertToString() ?? "unknown"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            case "displayMainScreen":
                guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
                let game = games[indexPath.row]
            
                let destination = segue.destination as! MainScreenViewController
            
                destination.game = game
            
            case "newGame":
                print("create game bar item tapped")
            
            default:
                print("unexpected segue identifier")
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let gameToDelete = games[indexPath.row]
            CoreDataHelper.delete(game: gameToDelete)
            
            games = CoreDataHelper.retrieveGames()
        }
    }
    
}

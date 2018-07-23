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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listGamesTableViewCell", for: indexPath) as! ListGamesTableViewCell
        cell.gameTitleLabel.text = "note's title"
        cell.gameDate.text = "note's modification time"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            case "displayMainScreen":
                print("note cell tapped")
            
            case "newGame":
                print("create game bar item tapped")
            
            default:
                print("unexpected segue identifier")
        }
    }
    
    
    
    
}

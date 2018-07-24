//
//  CoreDataHelper.swift
//  StatsVB
//
//  Created by Liam Bakar on 7/24/18.
//  Copyright © 2018 Liam Bakar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newGame() -> Game {
        let game = NSEntityDescription.insertNewObject(forEntityName: "Game", into: context) as! Game
        
        return game
    }
    static func saveGame() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    static func delete(game: Game){
        context.delete(game)
        saveGame()
    }
    
    static func retrieveGames() -> [Game]{
        do{
            let fetchRequest = NSFetchRequest<Game>(entityName: "Game")
            let results = try context.fetch(fetchRequest)
            
            return results
        }
        catch let error{
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }

}



//
//  ViewController.swift
//  CoreDataInheritance
//
//  Created by Randall Mardus on 2/17/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context: NSManagedObjectContext?
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    // createData()
        
     //   guard let context = context else {return}
     //   fetchAnimals(context)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fetchDataTapped(sender: UIButton) {
    }
    
    func createData() {
        let landAnimals = [(name: "Dog", legs: 4, environment: "House"), (name: "Lion", legs: 4, environment: "Savannah"), (name: "Elephant", legs: 4, environment: "Savannah"), (name: "Howler monkey", legs: 2, environment: "Jungle")]
        
        for land in landAnimals {
            guard let newLandAnimal = NSEntityDescription.insertNewObjectForEntityForName("Land", inManagedObjectContext: context!) as? Land else {continue}
            newLandAnimal.name = land.name
            newLandAnimal.legs = land.legs
            newLandAnimal.environment = land.environment
        }
        
        let waterAnimals = [(name: "Otter", dorsalFin: 0, environment: "Rivers"), (name: "Dolphin", dorsalFin: 1, environment: "Ocean"), (name: "Seal", dorsalFin: 0, environment: "Ocean"), (name: "Beluga Whale", dorsalFin: 1, environment: "Ocean")]
        
        for water in waterAnimals {
            guard let newWaterAnimal = NSEntityDescription.insertNewObjectForEntityForName("Water", inManagedObjectContext: context!) as? Water else {continue}
            newWaterAnimal.name = water.name
            newWaterAnimal.dorsalFin = water.dorsalFin
            newWaterAnimal.environment = water.environment
        }
        
        do {
            try context!.save()
        } catch {
            print("Error saving!")
        }
    }
    
    func fetchAnimals(context: NSManagedObjectContext) -> [Mammal]? {
        let request = NSFetchRequest(entityName: "Mammal")
        
        do {
            guard let animals = try context.executeFetchRequest(request) as? [Mammal] else {return nil}
            print(animals.map{"Name: \($0.name!), Environment: \($0.environment)"}.joinWithSeparator("\n"))
                return animals
                } catch {
                print("We couldn't fetch.")
            }
            return nil
        }

    func updateUI(animals: [Mammal]) {
        resultsLabel.text = animals.map{"The \($0.name!) lives in the \($0.environment!)."}.joinWithSeparator("\n")
    }
}

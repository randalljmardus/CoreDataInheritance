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
    }


}


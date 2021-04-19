//
//  CoreDataManager.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 19/04/21.
//

import CoreData

class CoreDataManager {
    
    private let container: NSPersistentContainer!
    private let dataBaseName = "DataModel"
    
    init() {
        container = NSPersistentContainer(name: dataBaseName)
        configureDatabase()
    }
    
    private func configureDatabase() {
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unable to load persistent stores: \(error) , \(error.userInfo)")
            }
            print("CoreData: \(self.dataBaseName) Loaded!")
            print("Sqlite File: \(NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!)")
        }
    }
    
    func seed() {
        let context = container.viewContext
        let exerciseDone = History(context: context)
        exerciseDone.name = "Flexiones"
        exerciseDone.reps = 8
        exerciseDone.duration = 18
        exerciseDone.totalTime = 24

        do {
            try context.save()
            print("Seeds created!")
        } catch  {
            print("Error creating seeds, \(error)")
        }
    }
    
    
}

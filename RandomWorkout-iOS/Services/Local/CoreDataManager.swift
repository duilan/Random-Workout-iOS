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
    
    func addToHistory(exercise: Exercise, workout: Workout, counterTime: Int, completion: @escaping() -> Void) {
        let context = container.viewContext
        let item = History(context: context)
        item.name = String(exercise.name)
        item.repetitions = Int64(workout.repetitions)
        item.time = Int64(workout.time)
        item.counterTime = Int64(counterTime)
        item.date = Date()
        
        do {
            try context.save()
            print("Exercise saved to history list")
            completion()
        } catch {
            print("Error saving exercise to history list. \(error)")
        }
        
    }
    
}

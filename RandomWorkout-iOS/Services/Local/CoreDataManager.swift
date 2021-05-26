//
//  CoreDataManager.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 19/04/21.
//

import CoreData

final class CoreDataManager {
    
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
    
    func fetchHistory() -> [History] {
        let request: NSFetchRequest<History> = History.fetchRequest()
        let sortChronological = NSSortDescriptor(key: #keyPath(History.date), ascending: false)
        request.sortDescriptors = [sortChronological]
        
        let context = container.viewContext
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Error fetching history")
        }
        return []
    }
    
    func addToHistory(exercise: Exercise, workout: Workout, counterTime: Int, completion: @escaping() -> Void) {
        let context = container.viewContext
        let item = History(context: context)
        item.id = String(exercise.videoFileName)
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
    
    func delete(_ object: NSManagedObject) {
        let context = container.viewContext
        context.delete(object)
        do {
            try context.save()
        } catch  {
            print("Error borrando")
        }
    }
    
}

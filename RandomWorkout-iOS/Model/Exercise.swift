//
//  Exercise.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 26/01/21.
//

struct Exercise {
    let name: String
    let descripcion: String
    let videoFileName: String
    let workout: Workout
}

struct Workout {
    let minReps: Int
    let maxReps: Int
    let durationRep: Int // 60 seconds = 1 min 
}

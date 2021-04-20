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
    let minReps: Int
    let maxReps: Int
    let durationPerRep: Int // seconds
}

struct Workout {
    let repetitions: Int
    let time: Int // seconds
}

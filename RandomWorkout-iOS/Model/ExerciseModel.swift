//
//  Exercises.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 26/01/21.
//

struct ExerciseModel {
    let exercises = [
        Exercise(name: "Descanso", descripcion: "Tomate un descanso y bebe agua para rehidratarte!", videoFileName: "drink_water", minReps: 1, maxReps: 1, durationPerRep: 60),
        Exercise(name: "Bicicleta de Aire", descripcion: "Fortaleze area abdominal", videoFileName: "air_bike", minReps: 10, maxReps: 30, durationPerRep: 3),
        Exercise(name: "Burpee con Flexion", descripcion: "Trabaja todo el cuerpo", videoFileName: "burpee_with_push_up", minReps: 5, maxReps: 15, durationPerRep: 10),
        Exercise(name: "Trote Estatico", descripcion: "Fortalecimiento inferior", videoFileName: "butt_kickers", minReps: 1, maxReps: 1, durationPerRep: 120),
        Exercise(name: "Desplante Frontal", descripcion: "Fortalecimeitno inferior e equilibrio", videoFileName: "forward_lunges", minReps: 10, maxReps: 30, durationPerRep: 4),
        Exercise(name: "Sentadilla con Peso", descripcion: "Fortaleze piernas", videoFileName: "goblet_squat", minReps: 10, maxReps: 20, durationPerRep: 4),
        Exercise(name: "Saltos de Tijera Lateral", descripcion: "Fortaleze piernas", videoFileName: "jumping_jacks", minReps: 5, maxReps: 20, durationPerRep: 4),
        Exercise(name: "Escaladores", descripcion: "Fortaleceras area abdominal y cadera", videoFileName: "montain_climbers", minReps: 10, maxReps: 20, durationPerRep: 4),
        Exercise(name: "Flexiones", descripcion: "Este ejercicio fortaleze pecho,brazos y core", videoFileName: "push_ups", minReps: 5, maxReps: 12, durationPerRep: 3),
        Exercise(name: "Crunch Inverso", descripcion: "Fortaleceras area abdominal superior", videoFileName: "reverse_crunch", minReps: 5, maxReps: 12, durationPerRep: 3),
        Exercise(name: "Saltos de Tijera Frontal", descripcion: "Fortalecimiento de piernas y resistencia", videoFileName: "scissor_hops", minReps: 5, maxReps: 15, durationPerRep: 3)
    ]
    
    func getRandomExercise() -> Exercise {
        let total = exercises.count - 1
        let randomNumber = Int.random(in: 0...total)
        let exercise = exercises[randomNumber]
        return exercise
    }
}

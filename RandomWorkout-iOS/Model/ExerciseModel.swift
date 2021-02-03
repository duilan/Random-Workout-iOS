//
//  Exercises.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 26/01/21.
//

struct ExerciseModel {
    let exercises = [
        Exercise(name: "Descanso", descripcion: "Tomate un descanso y bebe agua para rehidratarte!", videoFileName: "drink_water", workout: Workout(minReps: 1, maxReps: 1, durationRep: 60)),
        Exercise(name: "Bicicleta de Aire", descripcion: "Fortaleze area abdominal", videoFileName: "air_bike", workout: Workout(minReps: 10, maxReps: 30, durationRep: 3)),
        Exercise(name: "Burpee con Flexion", descripcion: "Trabaja todo el cuerpo", videoFileName: "burpee_with_push_up", workout: Workout(minReps: 5, maxReps: 15, durationRep: 10)),
        Exercise(name: "Trote Estatico", descripcion: "Fortalecimiento inferior", videoFileName: "butt_kickers", workout: Workout(minReps: 1, maxReps: 1, durationRep: 120)),
        Exercise(name: "Desplante Frontal", descripcion: "Fortalecimeitno inferior e equilibrio", videoFileName: "forward_lunges", workout: Workout(minReps: 10, maxReps: 30, durationRep: 4)),
        Exercise(name: "Sentadilla con Peso", descripcion: "Fortaleze piernas", videoFileName: "goblet_squat", workout: Workout(minReps: 10, maxReps: 20, durationRep: 4)),
        Exercise(name: "Saltos de Tijera Lateral", descripcion: "Fortaleze piernas", videoFileName: "jumping_jacks", workout: Workout(minReps: 5, maxReps: 20, durationRep: 4)),
        Exercise(name: "Escaladores", descripcion: "Fortaleceras area abdominal y cadera", videoFileName: "montain_climbers", workout: Workout(minReps: 10, maxReps: 20, durationRep: 4)),
        Exercise(name: "Flexiones", descripcion: "Este ejercicio fortaleze pecho,brazos y core", videoFileName: "push_ups", workout: Workout(minReps: 5, maxReps: 12, durationRep: 3)),
        Exercise(name: "Crunch Inverso", descripcion: "Fortaleceras area abdominal superior", videoFileName: "reverse_crunch", workout: Workout(minReps: 5, maxReps: 12, durationRep: 3)),
        Exercise(name: "Saltos de Tijera Frontal", descripcion: "Fortalecimiento de piernas y resistencia", videoFileName: "scissor_hops", workout: Workout(minReps: 5, maxReps: 15, durationRep: 3))
    ]
    
    func getRandomExercise() -> Exercise {
        let total = exercises.count - 1
        let randomNumber = Int.random(in: 0...total)
        let exercise = exercises[randomNumber]
        return exercise
    }
}

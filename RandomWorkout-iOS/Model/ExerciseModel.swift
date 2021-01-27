//
//  Exercises.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 26/01/21.
//

struct ExerciseModel {
    let exercises = [
        Exercise(name: "Descanso", descripcion: "Tomate un descanso y bebe agua para rehidratarte!", videoFileName: "drink_water"),
        Exercise(name: "Bicicleta de Aire", descripcion: "Fortaleze area abdominal", videoFileName: "air_bike"),
        Exercise(name: "Burpee con Flexion", descripcion: "Trabaja todo el cuerpo", videoFileName: "burpee_with_push_up"),
        Exercise(name: "Trote Estatico", descripcion: "Fortalecimiento inferior", videoFileName: "butt_kickers"),
        Exercise(name: "Desplante Frontal", descripcion: "Fortalecimeitno inferior e equilibrio", videoFileName: "forward_lunges"),
        Exercise(name: "Sentadilla con Peso", descripcion: "Fortaleze piernas", videoFileName: "goblet_squat"),
        Exercise(name: "Saltos de Tijera Lateral", descripcion: "Fortaleze piernas", videoFileName: "jumping_jacks"),
        Exercise(name: "Escaladores", descripcion: "Fortaleceras area abdominal y cadera", videoFileName: "montain_climbers"),
        Exercise(name: "Flexiones", descripcion: "Este ejercicio fortaleze pecho,brazos y core", videoFileName: "push_ups"),
        Exercise(name: "Crunch Inverso", descripcion: "Fortaleceras area abdominal superior", videoFileName: "reverse_crunch"),
        Exercise(name: "Saltos de Tijera Frontal", descripcion: "Fortalecimiento de piernas y resistencia", videoFileName: "scissor_hops")
    ]
    
    func getRandomExercise() -> Exercise {
        let total = exercises.count - 1
        let randomNumber = Int.random(in: 0...total)
        let exercise = exercises[randomNumber]
        return exercise
    }
}

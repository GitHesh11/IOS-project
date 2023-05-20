//
//  ExerciseModel.swift
//  FitnessApp
//
//

import Foundation

struct ExerciseModel: Identifiable {
    var id: String = UUID().uuidString
    var img: String
    var name: String
    var description:String
}

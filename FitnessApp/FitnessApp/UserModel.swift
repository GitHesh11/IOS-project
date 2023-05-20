//
//  UserModel.swift
//  FitnessApp
//
//


import Foundation
struct UserModel: Identifiable {
    var id: String = UUID().uuidString
    var userid : Int
    var phone: String
    var name: String
    var email: String
    var age: String
    var gender: String
}

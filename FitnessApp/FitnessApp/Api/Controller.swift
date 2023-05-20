//
//  Controller.swift
//  FitnessApp
//
import Foundation
import FirebaseDatabase
import FirebaseAuth


struct Controller {
    
    func login(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
    
    func registerUser(email: String, password: String,name:String,phone:String,age:String,gender:String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(res, error) in
            if let user = res?.user {
                let id=Int64((Date().timeIntervalSince1970 * 1000.0).rounded())
                let data    =  ["userid":id,
                                "name":name,
                                "email":email,
                                "age":age,
                                "gender":gender,
                                "phone":phone] as [String : Any]
                
                var db: DatabaseReference!
                db = Database.database().reference()
                db.child("users").child(user.uid).setValue(data)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    
    
    
    
    func getCurLoginUser(completionBlock: @escaping (_ success: UserModel,Int) -> Void){
        var db: DatabaseReference!
        db = Database.database().reference()
        guard let id = Auth.auth().currentUser?.uid else {
            completionBlock(UserModel(id: "0", userid:0,phone: "",name: "",email: "",age: "",gender:""),0)
            return
        }
        db.child("users").child(id).observeSingleEvent(of: .value, with: { (data) in
            let user = data.value as! [String: Any]
            completionBlock(UserModel(id: id, userid: user["userid"] as! Int,phone: user["phone"] as! String,name: user["name"] as! String,email: user["email"] as! String,age: user["age"] as! String,gender:user["gender"] as! String),1)
        })
        
    }
    
    func getExercises(completionBlock: @escaping (_ success: [ExerciseModel]) -> Void) {
        
        var foodList:[ExerciseModel] = []
        var db: DatabaseReference!
        db = Database.database().reference()
        
        db.child("exercises").queryOrderedByKey().observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                
                let placeDict = snap.value as! [String: Any]
                let img = placeDict["img"] as! String
                let name = placeDict["name"] as! String
                let description = placeDict["description"] as! String
                
                foodList.append(ExerciseModel(img: img, name: name,description:description))
            }
            completionBlock(foodList)
        }
        
    }
    
    
    func signOut(){
        try! Auth.auth().signOut();
    }
    
}

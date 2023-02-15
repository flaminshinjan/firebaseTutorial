//
//  DataManager.swift
//  firebaseTutorial
//
//  Created by Shinjan Patra on 14/02/23.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject{
    @Published var dogs: [Dog] = []
    
    init(){
        fetchDogs()
    }
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    
                    let dog = Dog(id: id, breed: breed)
                    self.dogs.append(dog)
                }
            }
        }
    }
    func addDog(dogbreed: String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogbreed)
        ref.setData(["breed": dogbreed, "id": 10]){ error in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }

}
